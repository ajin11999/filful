import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';

class PoItemCheckerScreen extends ConsumerStatefulWidget {
  final String poId;
  final String batchId;
  final int initialIndex;

  const PoItemCheckerScreen({
    super.key,
    required this.poId,
    required this.batchId,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<PoItemCheckerScreen> createState() => _PoItemCheckerScreenState();
}

class _PoItemCheckerScreenState extends ConsumerState<PoItemCheckerScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNext(int totalItems) {
    if (_currentIndex < totalItems - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    } else {
      _showCompletionDialog();
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pemeriksaan Selesai! 🎉', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          content: const Text(
            'Semua item telah diperiksa. Anda dapat melihat ringkasan atau langsung mencetak Surat Jalan & Invoice.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tetap di Sini', style: TextStyle(fontSize: 16)),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/invoice/${widget.poId}/${widget.batchId}');
              },
              child: const Text('Buat Surat Jalan & Invoice', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _fulfillAsOrdered(FulfillmentItemWithPoItem item, int totalItems) async {
    HapticFeedback.mediumImpact();
    final db = ref.read(databaseProvider);
    await db.fulfillSingleItemAsOrdered(
      fulfillmentItemId: item.fulfillmentItem.id,
      requestedQty: item.poItem.requestedQty,
      targetUnitPrice: item.poItem.targetUnitPrice,
    );
    _goToNext(totalItems);
  }

  Future<void> _markOutOfStock(FulfillmentItemWithPoItem item, int totalItems) async {
    HapticFeedback.lightImpact();
    final db = ref.read(databaseProvider);
    await db.updateFulfillmentItem(
      fulfillmentItemId: item.fulfillmentItem.id,
      fulfilledQty: 0.0,
      billedUnitPrice: item.poItem.targetUnitPrice,
      status: 'out_of_stock',
      note: 'Barang kosong / tidak tersedia',
    );
    _goToNext(totalItems);
  }

  void _showEditSheet(FulfillmentItemWithPoItem item, int totalItems) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _OversizedEditSheet(
        item: item,
        onSavedAndNext: () {
          Navigator.of(context).pop();
          _goToNext(totalItems);
        },
      ),
    );
  }

  void _showJumpSheet(List<FulfillmentItemWithPoItem> items) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Pilih Item (Total ${items.length} Item)',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final it = items[index];
                      Color bgColor = Colors.grey.shade200;
                      Color textColor = Colors.black87;

                      if (it.isFulfilled) {
                        bgColor = Colors.green.shade600;
                        textColor = Colors.white;
                      } else if (it.isOutOfStock) {
                        bgColor = Colors.red.shade400;
                        textColor = Colors.white;
                      } else if (it.isPartial) {
                        bgColor = Colors.amber.shade700;
                        textColor = Colors.white;
                      }

                      final isCurrent = index == _currentIndex;

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          _pageController.jumpToPage(index);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                            border: isCurrent
                                ? Border.all(color: Colors.blue.shade900, width: 3)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);

    return StreamBuilder<List<FulfillmentItemWithPoItem>>(
      stream: db.watchBatchItems(widget.batchId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final items = snapshot.data!;
        if (items.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('Tidak ada item pada PO ini.')),
          );
        }

        final totalItems = items.length;

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: const Text('Pemeriksaan Item per Item'),
            actions: [
              IconButton(
                icon: const Icon(Icons.grid_view_rounded, size: 28),
                tooltip: 'Daftar Semua Item',
                onPressed: () => _showJumpSheet(items),
              ),
            ],
          ),
          body: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemCount: totalItems,
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildItemCard(item, index, totalItems, theme);
            },
          ),
        );
      },
    );
  }

  Widget _buildItemCard(
    FulfillmentItemWithPoItem item,
    int index,
    int totalItems,
    ThemeData theme,
  ) {
    final poItem = item.poItem;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Item Counter & Navigation Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded, size: 28),
                onPressed: index > 0 ? _goToPrevious : null,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Item ${index + 1} dari $totalItems',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 28),
                onPressed: index < totalItems - 1 ? () => _goToNext(totalItems) : null,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Main Big Item Focus Card
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Senior-Friendly Massive Item Name
                    Text(
                      poItem.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),

                    // PO Target Specifications (Oversized Box)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue.shade200, width: 1.5),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'PESANAN DARI PO:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${CurrencyFormatter.formatQty(poItem.requestedQty)} ${poItem.uom}',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '@ ${CurrencyFormatter.formatIdr(poItem.targetUnitPrice)} / ${poItem.uom}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total Target: ${CurrencyFormatter.formatIdr(poItem.targetTotalPrice)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Current Fulfillment Status Indicator
                    _buildCurrentStatusBadge(item),

                    const Spacer(),

                    // Giant Action Buttons for Seniors
                    // 1. Primary Big Green Button: Sesuai PO & Lanjut
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(66),
                        backgroundColor: Colors.green.shade700,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        elevation: 3,
                      ),
                      onPressed: () => _fulfillAsOrdered(item, totalItems),
                      icon: const Icon(Icons.check_circle_rounded, size: 32, color: Colors.white),
                      label: const Text(
                        '✓ Sesuai PO & Lanjut',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 2. Big Secondary Button: Ubah Jumlah / Harga
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(54),
                        side: BorderSide(color: Colors.amber.shade800, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => _showEditSheet(item, totalItems),
                      icon: Icon(Icons.edit_note_rounded, size: 28, color: Colors.amber.shade900),
                      label: Text(
                        '✏️ Ubah Jumlah / Harga',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.amber.shade900),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Row: Kosong & Lewati
                    Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              foregroundColor: Colors.red.shade700,
                            ),
                            onPressed: () => _markOutOfStock(item, totalItems),
                            icon: const Icon(Icons.cancel_outlined, size: 22),
                            label: const Text(
                              'Barang Kosong',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              foregroundColor: Colors.grey.shade700,
                            ),
                            onPressed: () => _goToNext(totalItems),
                            icon: const Icon(Icons.skip_next_rounded, size: 24),
                            label: const Text(
                              'Lewati (Next)',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCurrentStatusBadge(FulfillmentItemWithPoItem item) {
    final f = item.fulfillmentItem;
    if (f.status == 'fulfilled') {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green.shade700, size: 20),
            const SizedBox(width: 8),
            Text(
              'Terpenuhi: ${CurrencyFormatter.formatQty(f.fulfilledQty)} ${item.poItem.uom} = ${CurrencyFormatter.formatIdr(f.finalTotalPrice)}',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade800, fontSize: 14),
            ),
          ],
        ),
      );
    } else if (f.status == 'out_of_stock') {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel, color: Colors.red.shade700, size: 20),
            const SizedBox(width: 8),
            Text(
              'Status: Barang Kosong (0 Qty)',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade800, fontSize: 14),
            ),
          ],
        ),
      );
    } else if (f.status == 'partial') {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber.shade400),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pie_chart, color: Colors.amber.shade800, size: 20),
            const SizedBox(width: 8),
            Text(
              'Terpenuhi Sebagian: ${CurrencyFormatter.formatQty(f.fulfilledQty)} ${item.poItem.uom}',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Status: Belum Diperiksa (Pending)',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}

// Oversized Edit Sheet for Easy Senior Typing
class _OversizedEditSheet extends ConsumerStatefulWidget {
  final FulfillmentItemWithPoItem item;
  final VoidCallback onSavedAndNext;

  const _OversizedEditSheet({
    required this.item,
    required this.onSavedAndNext,
  });

  @override
  ConsumerState<_OversizedEditSheet> createState() => _OversizedEditSheetState();
}

class _OversizedEditSheetState extends ConsumerState<_OversizedEditSheet> {
  late TextEditingController _qtyController;
  late TextEditingController _priceController;
  late TextEditingController _modalController;
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    final f = widget.item.fulfillmentItem;
    final po = widget.item.poItem;

    final initialQty = f.fulfilledQty > 0 ? f.fulfilledQty : po.requestedQty;
    final initialPrice = f.billedUnitPrice > 0 ? f.billedUnitPrice : po.targetUnitPrice;

    _qtyController = TextEditingController(text: initialQty.toString().replaceAll(RegExp(r'\.0$'), ''));
    _priceController = TextEditingController(text: initialPrice.toStringAsFixed(0));
    _modalController = TextEditingController(
        text: f.purchaseCostPrice != null ? f.purchaseCostPrice!.toStringAsFixed(0) : '');
    _noteController = TextEditingController(text: f.note ?? '');
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _priceController.dispose();
    _modalController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _adjustQty(double delta) {
    final current = double.tryParse(_qtyController.text) ?? 0.0;
    final updated = (current + delta).clamp(0.0, 999999.0);
    _qtyController.text = updated.toString().replaceAll(RegExp(r'\.0$'), '');
    setState(() {});
  }

  Future<void> _saveChanges() async {
    final qty = double.tryParse(_qtyController.text) ?? 0.0;
    final price = double.tryParse(_priceController.text) ?? widget.item.poItem.targetUnitPrice;
    final modal = double.tryParse(_modalController.text);
    final note = _noteController.text.trim();

    String status = 'fulfilled';
    if (qty == 0) {
      status = 'out_of_stock';
    } else if (qty < widget.item.poItem.requestedQty) {
      status = 'partial';
    }

    final db = ref.read(databaseProvider);
    await db.updateFulfillmentItem(
      fulfillmentItemId: widget.item.fulfillmentItem.id,
      fulfilledQty: qty,
      billedUnitPrice: price,
      purchaseCostPrice: modal,
      status: status,
      note: note.isNotEmpty ? note : null,
    );

    widget.onSavedAndNext();
  }

  @override
  Widget build(BuildContext context) {
    final po = widget.item.poItem;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sesuaikan ${po.description}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Qty Stepper and Input
            Text(
              'Jumlah Terpenuhi (${po.uom}):',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton.filled(
                  style: IconButton.styleFrom(
                    minimumSize: const Size(54, 54),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  icon: const Icon(Icons.remove, color: Colors.black87, size: 28),
                  onPressed: () => _adjustQty(-1.0),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _qtyController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    minimumSize: const Size(54, 54),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  icon: const Icon(Icons.add, color: Colors.black87, size: 28),
                  onPressed: () => _adjustQty(1.0),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Billed Price
            Text(
              'Harga Satuan Ditagihkan (Rp):',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefixText: 'Rp ',
                helperText: 'Harga PO: ${CurrencyFormatter.formatIdr(po.targetUnitPrice)}',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),

            const SizedBox(height: 16),

            // Middleman Modal Cost (Optional)
            Text(
              'Modal Beli / Harga Beli Anda (Opsional - Rahasia):',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.indigo.shade800),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _modalController,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                prefixText: 'Rp ',
                hintText: 'Masukkan modal untuk hitung laba',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),

            const SizedBox(height: 16),

            // Notes
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Catatan (misal: ganti merek / selisih timbangan)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),

            const SizedBox(height: 24),

            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: _saveChanges,
              child: const Text(
                'Simpan & Lanjut ke Item Berikutnya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
