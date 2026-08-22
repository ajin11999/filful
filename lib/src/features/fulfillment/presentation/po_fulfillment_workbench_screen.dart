import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';
import 'po_item_checker_screen.dart';

class PoFulfillmentWorkbenchScreen extends ConsumerStatefulWidget {
  final String poId;

  const PoFulfillmentWorkbenchScreen({
    super.key,
    required this.poId,
  });

  @override
  ConsumerState<PoFulfillmentWorkbenchScreen> createState() => _PoFulfillmentWorkbenchScreenState();
}

class _PoFulfillmentWorkbenchScreenState extends ConsumerState<PoFulfillmentWorkbenchScreen> {
  String _selectedFilter = 'all'; // all, pending, fulfilled, out_of_stock

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);

    return FutureBuilder<PurchaseOrdersTableData?>(
      future: db.getPurchaseOrderById(widget.poId),
      builder: (context, poSnapshot) {
        if (!poSnapshot.hasData || poSnapshot.data == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final po = poSnapshot.data!;

        return StreamBuilder<FulfillmentBatchesTableData?>(
          stream: db.watchActiveBatchForPo(widget.poId),
          builder: (context, batchSnapshot) {
            if (!batchSnapshot.hasData || batchSnapshot.data == null) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final batch = batchSnapshot.data!;

            return StreamBuilder<List<FulfillmentItemWithPoItem>>(
              stream: db.watchBatchItems(batch.id),
              builder: (context, itemsSnapshot) {
                if (!itemsSnapshot.hasData) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }

                final items = itemsSnapshot.data!;
                final totalCount = items.length;
                final fulfilledCount = items.where((i) => i.isFulfilled).length;
                final partialCount = items.where((i) => i.isPartial).length;
                final outOfStockCount = items.where((i) => i.isOutOfStock).length;
                final pendingCount = items.where((i) => i.isPending).length;

                final billedTotal = items.fold(
                    0.0, (sum, i) => sum + i.fulfillmentItem.finalTotalPrice);
                final totalModal = items.fold(0.0, (sum, i) {
                  final modal = i.fulfillmentItem.purchaseCostPrice;
                  final qty = i.fulfillmentItem.fulfilledQty;
                  return modal != null ? sum + (modal * qty) : sum;
                });
                final hasModalEntered = totalModal > 0;
                final grossProfit = billedTotal - totalModal;

                final filteredItems = items.where((item) {
                  if (_selectedFilter == 'pending') return item.isPending;
                  if (_selectedFilter == 'fulfilled') return item.isFulfilled || item.isPartial;
                  if (_selectedFilter == 'out_of_stock') return item.isOutOfStock;
                  return true;
                }).toList();

                return Scaffold(
                  appBar: AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(po.poNumber, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(po.companyName, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                    actions: [
                      PopupMenuButton<String>(
                        onSelected: (val) async {
                          if (val == 'fulfill_all') {
                            await db.fulfillAllExactForBatch(batch.id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Semua item ditandai Sesuai PO')),
                              );
                            }
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'fulfill_all',
                            child: Row(
                              children: [
                                Icon(Icons.done_all, color: Colors.green),
                                SizedBox(width: 8),
                                Text('Tandai Semua Sesuai PO'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  bottomNavigationBar: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                minimumSize: const Size.fromHeight(56),
                                backgroundColor: theme.colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                context.push('/invoice/${po.id}/${batch.id}');
                              },
                              icon: const Icon(Icons.picture_as_pdf_rounded, size: 26),
                              label: const Text(
                                'Buat Surat Jalan & Invoice',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Prominent "One-by-One Item Checker" Launch Card
                      Card(
                        elevation: 3,
                        color: Colors.indigo.shade700,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.visibility_rounded, color: Colors.amberAccent, size: 32),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'Mode Periksa Satu per Satu',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Tampilan khusus tulisan besar & tombol raksasa untuk mempermudah pengecekan barang di pasar.',
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                              const SizedBox(height: 16),
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  minimumSize: const Size.fromHeight(54),
                                  backgroundColor: Colors.amberAccent.shade700,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PoItemCheckerScreen(
                                        poId: po.id,
                                        batchId: batch.id,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                                label: const Text(
                                  'Mulai Periksa Satu per Satu',
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Live Progress & Billed Stats Card
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Kemajuan Pemenuhan:',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                  ),
                                  Text(
                                    '$fulfilledCount dari $totalCount item (${totalCount > 0 ? ((fulfilledCount / totalCount) * 100).toInt() : 0}%)',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: totalCount > 0 ? fulfilledCount / totalCount : 0.0,
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(5),
                                backgroundColor: Colors.grey.shade200,
                                color: Colors.green.shade600,
                              ),
                              const SizedBox(height: 16),
                              const Divider(),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Tagihan Sementara:'),
                                  Text(
                                    CurrencyFormatter.formatIdr(billedTotal),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              if (hasModalEntered) ...[
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Modal Belanja:', style: TextStyle(color: Colors.grey.shade700)),
                                    Text(
                                      CurrencyFormatter.formatIdr(totalModal),
                                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade800),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Perkiraan Laba Bersih:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo.shade900),
                                    ),
                                    Text(
                                      '${CurrencyFormatter.formatIdr(grossProfit)} (${billedTotal > 0 ? ((grossProfit / billedTotal) * 100).toStringAsFixed(1) : 0}%)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Filter Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('all', 'Semua ($totalCount)'),
                            const SizedBox(width: 8),
                            _buildFilterChip('pending', 'Belum ($pendingCount)'),
                            const SizedBox(width: 8),
                            _buildFilterChip('fulfilled', 'Terpenuhi (${fulfilledCount + partialCount})'),
                            const SizedBox(width: 8),
                            _buildFilterChip('out_of_stock', 'Kosong ($outOfStockCount)'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Item List
                      ...filteredItems.map((item) {
                        return _buildItemRow(item, batch.id, theme);
                      }),

                      const SizedBox(height: 80),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedFilter == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => _selectedFilter = value);
      },
    );
  }

  Widget _buildItemRow(
    FulfillmentItemWithPoItem item,
    String batchId,
    ThemeData theme,
  ) {
    final poItem = item.poItem;
    final fItem = item.fulfillmentItem;

    Color badgeColor = Colors.grey.shade400;
    IconData badgeIcon = Icons.hourglass_empty_rounded;
    String statusText = 'Belum';

    if (item.isFulfilled) {
      badgeColor = Colors.green.shade600;
      badgeIcon = Icons.check_circle_rounded;
      statusText = '${CurrencyFormatter.formatQty(fItem.fulfilledQty)} ${poItem.uom}';
    } else if (item.isOutOfStock) {
      badgeColor = Colors.red.shade600;
      badgeIcon = Icons.cancel_rounded;
      statusText = 'Kosong';
    } else if (item.isPartial) {
      badgeColor = Colors.amber.shade800;
      badgeIcon = Icons.pie_chart_rounded;
      statusText = '${CurrencyFormatter.formatQty(fItem.fulfilledQty)} ${poItem.uom}';
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PoItemCheckerScreen(
                poId: widget.poId,
                batchId: batchId,
                initialIndex: poItem.itemIndex - 1,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: badgeColor.withValues(alpha: 0.15),
          child: Icon(badgeIcon, color: badgeColor),
        ),
        title: Text(
          '${poItem.itemIndex}. ${poItem.description}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesanan: ${CurrencyFormatter.formatQty(poItem.requestedQty)} ${poItem.uom} @ ${CurrencyFormatter.formatIdr(poItem.targetUnitPrice)}',
            ),
            if (fItem.status != 'pending')
              Text(
                'Terpenuhi: $statusText @ ${CurrencyFormatter.formatIdr(fItem.billedUnitPrice)} = ${CurrencyFormatter.formatIdr(fItem.finalTotalPrice)}',
                style: TextStyle(color: badgeColor, fontWeight: FontWeight.w600),
              ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
