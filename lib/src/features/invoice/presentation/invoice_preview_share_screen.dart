import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';
import '../data/pdf_delivery_note_generator.dart';
import '../data/pdf_invoice_generator.dart';

class InvoicePreviewShareScreen extends ConsumerStatefulWidget {
  final String poId;
  final String batchId;

  const InvoicePreviewShareScreen({
    super.key,
    required this.poId,
    required this.batchId,
  });

  @override
  ConsumerState<InvoicePreviewShareScreen> createState() => _InvoicePreviewShareScreenState();
}

class _InvoicePreviewShareScreenState extends ConsumerState<InvoicePreviewShareScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSharing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _shareViaWhatsApp({
    required PurchaseOrdersTableData po,
    required FulfillmentBatchesTableData batch,
    required List<FulfillmentItemWithPoItem> items,
  }) async {
    setState(() => _isSharing = true);
    try {
      final tempDir = await getTemporaryDirectory();

      // Generate both PDFs
      final sjBytes = await PdfDeliveryNoteGenerator.generate(po: po, batch: batch, items: items);
      final invBytes = await PdfInvoiceGenerator.generate(po: po, batch: batch, items: items);

      final sjFile = File('${tempDir.path}/Surat_Jalan_${po.poNumber.replaceAll('/', '_')}.pdf');
      final invFile = File('${tempDir.path}/Invoice_${po.poNumber.replaceAll('/', '_')}.pdf');

      await sjFile.writeAsBytes(sjBytes);
      await invFile.writeAsBytes(invBytes);

      final totalDelivered = items.where((i) => i.fulfillmentItem.fulfilledQty > 0).length;
      final grandTotal = items.fold(0.0, (sum, i) => sum + i.fulfillmentItem.finalTotalPrice);

      final messageText = '''
Halo Tim Purchasing ${po.companyName},

Terlampir Surat Jalan & Invoice Tagihan untuk:
* ${po.poNumber}
* Tanggal: ${po.poDate.day}/${po.poDate.month}/${po.poDate.year}
* Total Item Dikirim: $totalDelivered item
* Total Tagihan: ${CurrencyFormatter.formatIdr(grandTotal)}

Mohon diproses untuk penerimaan dan pembayaran via transfer bank.
Terima kasih.
''';

      await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile(sjFile.path, name: 'Surat_Jalan.pdf'),
            XFile(invFile.path, name: 'Invoice.pdf'),
          ],
          text: messageText,
          subject: 'Invoice & Surat Jalan ${po.poNumber}',
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal membagikan dokumen: $e'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);

    return FutureBuilder<PurchaseOrdersTableData?>(
      future: db.getPurchaseOrderById(widget.poId),
      builder: (context, poSnapshot) {
        if (!poSnapshot.hasData || poSnapshot.data == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final po = poSnapshot.data!;

        return StreamBuilder<FulfillmentBatchesTableData?>(
          stream: db.watchActiveBatchForPo(widget.poId),
          builder: (context, batchSnapshot) {
            if (!batchSnapshot.hasData || batchSnapshot.data == null) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }

            final batch = batchSnapshot.data!;

            return StreamBuilder<List<FulfillmentItemWithPoItem>>(
              stream: db.watchBatchItems(batch.id),
              builder: (context, itemsSnapshot) {
                if (!itemsSnapshot.hasData) {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                }

                final items = itemsSnapshot.data!;

                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Surat Jalan & Invoice',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    bottom: TabBar(
                      controller: _tabController,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      tabs: const [
                        Tab(icon: Icon(Icons.local_shipping_outlined, size: 24), text: 'Surat Jalan'),
                        Tab(icon: Icon(Icons.receipt_outlined, size: 24), text: 'Invoice Tagihan'),
                      ],
                    ),
                  ),
                  bottomNavigationBar: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size.fromHeight(64),
                          backgroundColor: Colors.green.shade800,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: _isSharing
                            ? null
                            : () => _shareViaWhatsApp(po: po, batch: batch, items: items),
                        icon: _isSharing
                            ? const SizedBox(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                              )
                            : const Icon(Icons.share_rounded, size: 30),
                        label: Text(
                          _isSharing ? 'Menyiapkan PDF...' : 'Kirim via WhatsApp / Bagikan PDF',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      // Tab 1: Surat Jalan PDF Preview
                      PdfPreview(
                        build: (format) => PdfDeliveryNoteGenerator.generate(
                          po: po,
                          batch: batch,
                          items: items,
                        ),
                        allowPrinting: true,
                        allowSharing: false,
                        canChangePageFormat: false,
                      ),

                      // Tab 2: Invoice PDF Preview
                      PdfPreview(
                        build: (format) => PdfInvoiceGenerator.generate(
                          po: po,
                          batch: batch,
                          items: items,
                        ),
                        allowPrinting: true,
                        allowSharing: false,
                        canChangePageFormat: false,
                      ),
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
}
