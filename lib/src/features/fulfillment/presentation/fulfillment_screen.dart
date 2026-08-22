import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';

class FulfillmentScreen extends ConsumerWidget {
  const FulfillmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Pemenuhan & Pengiriman'),
      ),
      body: StreamBuilder<List<PurchaseOrdersTableData>>(
        stream: db.watchAllPurchaseOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final poList = snapshot.data ?? [];
          if (poList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 64,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum Ada Pengiriman',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Impor PO untuk mulai memproses pengiriman dan pembuatan Surat Jalan.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: poList.length,
            itemBuilder: (context, index) {
              final po = poList[index];

              return StreamBuilder<FulfillmentBatchesTableData?>(
                stream: db.watchActiveBatchForPo(po.id),
                builder: (context, batchSnapshot) {
                  final batch = batchSnapshot.data;
                  if (batch == null) return const SizedBox.shrink();

                  return StreamBuilder<List<FulfillmentItemWithPoItem>>(
                    stream: db.watchBatchItems(batch.id),
                    builder: (context, itemsSnapshot) {
                      final items = itemsSnapshot.data ?? [];
                      final total = items.length;
                      final fulfilled = items.where((i) => i.isFulfilled).length;
                      final billed = items.fold(0.0, (sum, i) => sum + i.fulfillmentItem.finalTotalPrice);
                      final progress = total > 0 ? (fulfilled / total) : 0.0;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
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
                                    batch.batchNumber,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: progress == 1.0
                                          ? Colors.green.shade100
                                          : Colors.amber.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      progress == 1.0 ? 'Siap Dikirim' : 'Proses Belanja',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: progress == 1.0 ? Colors.green.shade800 : Colors.amber.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                po.companyName,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Reff PO: ${po.poNumber} • ${dateFormat.format(po.poDate)}',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Kemajuan: $fulfilled / $total item (${(progress * 100).toInt()}%)',
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    CurrencyFormatter.formatIdr(billed),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              LinearProgressIndicator(
                                value: progress,
                                borderRadius: BorderRadius.circular(4),
                                backgroundColor: Colors.grey.shade200,
                                color: Colors.green.shade600,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: () => context.push('/workbench/${po.id}'),
                                      icon: const Icon(Icons.edit_note_rounded, size: 20),
                                      label: const Text('Buka Lembar Kerja'),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton.filled(
                                    onPressed: () => context.push('/invoice/${po.id}/${batch.id}'),
                                    icon: const Icon(Icons.picture_as_pdf_rounded),
                                    tooltip: 'Cetak Surat Jalan & Invoice',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
