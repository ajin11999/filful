import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';
import '../domain/parsed_po.dart';

class PoImportPreviewScreen extends ConsumerStatefulWidget {
  final ParsedPo parsedPo;

  const PoImportPreviewScreen({
    super.key,
    required this.parsedPo,
  });

  @override
  ConsumerState<PoImportPreviewScreen> createState() => _PoImportPreviewScreenState();
}

class _PoImportPreviewScreenState extends ConsumerState<PoImportPreviewScreen> {
  bool _isSaving = false;

  Future<void> _saveAndProceed() async {
    setState(() => _isSaving = true);
    try {
      final db = ref.read(databaseProvider);
      final po = widget.parsedPo;

      final poId = await db.insertPoWithItems(
        poNumber: po.poNumber,
        companyName: po.companyName,
        vendorName: po.vendorName,
        deliveryDestination: po.deliveryDestination,
        poDate: po.poDate,
        deliveryDate: po.deliveryDate,
        subtotal: po.subtotal,
        discount: po.discount,
        tax: po.tax,
        grandTotal: po.grandTotal,
        notes: po.notes,
        items: po.items.map((item) {
          return (
            itemIndex: item.itemIndex,
            description: item.description,
            requestedQty: item.requestedQty,
            uom: item.uom,
            targetUnitPrice: item.targetUnitPrice,
            targetTotalPrice: item.targetTotalPrice,
            category: item.category,
          );
        }).toList(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PO ${po.poNumber} berhasil diimpor!'),
            backgroundColor: Colors.green.shade700,
          ),
        );
        // Navigate directly to the Workbench / Checker for this PO
        context.go('/workbench/$poId');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan PO: $e'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final po = widget.parsedPo;
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd MMMM yyyy', 'id_ID');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratinjau Hasil Impor PO'),
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
              minimumSize: const Size.fromHeight(56),
              backgroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _isSaving ? null : _saveAndProceed,
            icon: _isSaving
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                  )
                : const Icon(Icons.check_circle_outline, size: 28),
            label: Text(
              _isSaving ? 'Menyimpan ke Database...' : 'Simpan & Mulai Pengecekan',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.receipt_long, color: theme.colorScheme.onPrimaryContainer, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              po.poNumber,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Text(
                              po.companyName,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  _buildInfoRow('Vendor', po.vendorName, theme),
                  _buildInfoRow('Tujuan Pengiriman', po.deliveryDestination, theme),
                  _buildInfoRow('Tanggal PO', dateFormat.format(po.poDate), theme),
                  if (po.deliveryDate != null)
                    _buildInfoRow('Target Pengiriman', dateFormat.format(po.deliveryDate!), theme),
                  const Divider(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Nilai PO (${po.items.length} Item):',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        CurrencyFormatter.formatIdr(po.grandTotal),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.green.shade800,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Daftar Item (${po.items.length})',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),

          // Items Table / List
          ...po.items.map((item) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  child: Text(
                    '${item.itemIndex}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                title: Text(
                  item.description,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${CurrencyFormatter.formatQty(item.requestedQty)} ${item.uom} × ${CurrencyFormatter.formatIdr(item.targetUnitPrice)}',
                ),
                trailing: Text(
                  CurrencyFormatter.formatIdr(item.targetTotalPrice),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, ThemeData theme) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
