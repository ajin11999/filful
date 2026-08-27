import 'dart:typed_data';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';

class PdfDeliveryNoteGenerator {
  const PdfDeliveryNoteGenerator();

  static Future<Uint8List> generate({
    required PurchaseOrdersTableData po,
    required FulfillmentBatchesTableData batch,
    required List<FulfillmentItemWithPoItem> items,
  }) async {
    await initializeDateFormatting('id_ID', null);
    final pdf = pw.Document();
    final dateFormat = DateFormat('dd MMMM yyyy', 'id_ID');

    final deliveredItems = items.where((i) => i.fulfillmentItem.fulfilledQty > 0).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) {
          return [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      po.vendorName.isNotEmpty ? po.vendorName : 'SUPPLIER / VENDOR',
                      style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Pemasok Barang & Kebutuhan Operasional',
                      style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
                    ),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'SURAT JALAN',
                      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: PdfColors.blue800),
                    ),
                    pw.Text(
                      'No: ${batch.deliveryNoteNumber ?? batch.batchNumber}',
                      style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Tanggal: ${dateFormat.format(batch.fulfillmentDate)}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            pw.Divider(thickness: 1.5, color: PdfColors.blue800),
            pw.SizedBox(height: 8),

            // Metadata Box
            pw.Container(
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              ),
              child: pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildMetaItem('Kepada', po.companyName),
                        _buildMetaItem('Tujuan Pengiriman', po.deliveryDestination),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 16),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildMetaItem('Referensi PO', po.poNumber),
                        _buildMetaItem('Tanggal PO', dateFormat.format(po.poDate)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 12),

            // Table of Delivered Items
            pw.TableHelper.fromTextArray(
              headers: ['No', 'Nama Barang / Keterangan', 'Qty Kirim', 'Satuan', 'Catatan / Status'],
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.white),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.blue800),
              cellHeight: 22,
              cellStyle: const pw.TextStyle(fontSize: 9),
              cellAlignments: {
                0: pw.Alignment.center,
                1: pw.Alignment.centerLeft,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.center,
                4: pw.Alignment.centerLeft,
              },
              columnWidths: {
                0: const pw.FixedColumnWidth(28),
                1: const pw.FlexColumnWidth(4),
                2: const pw.FixedColumnWidth(60),
                3: const pw.FixedColumnWidth(45),
                4: const pw.FlexColumnWidth(2.5),
              },
              data: deliveredItems.map((item) {
                final poItem = item.poItem;
                final fItem = item.fulfillmentItem;

                final hasQtyDifference = (fItem.fulfilledQty - poItem.requestedQty).abs() > 0.001;
                final String qtyText = hasQtyDifference
                    ? '${CurrencyFormatter.formatQty(fItem.fulfilledQty)}\n(PO: ${CurrencyFormatter.formatQty(poItem.requestedQty)})'
                    : CurrencyFormatter.formatQty(fItem.fulfilledQty);

                String statusNote = 'Lengkap';
                if (hasQtyDifference) {
                  statusNote = 'Sebagian (Dipesan PO: ${CurrencyFormatter.formatQty(poItem.requestedQty)} ${poItem.uom})';
                }
                if (fItem.note != null && fItem.note!.isNotEmpty) {
                  statusNote = '$statusNote - ${fItem.note}';
                }

                return [
                  '${poItem.itemIndex}',
                  poItem.description,
                  qtyText,
                  poItem.uom,
                  statusNote,
                ];
              }).toList(),
            ),

            pw.SizedBox(height: 16),

            // Signatures block
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                  width: 160,
                  child: pw.Column(
                    children: [
                      pw.Text('Yang Menyerahkan,', style: const pw.TextStyle(fontSize: 10)),
                      pw.SizedBox(height: 48),
                      pw.Text('( ${po.vendorName.isNotEmpty ? po.vendorName : 'Pengirim'} )', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      pw.Text('Driver / Supplier', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                    ],
                  ),
                ),
                pw.Container(
                  width: 160,
                  child: pw.Column(
                    children: [
                      pw.Text('Yang Menerima / Gudang,', style: const pw.TextStyle(fontSize: 10)),
                      pw.SizedBox(height: 48),
                      pw.Text('( ........................................ )', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      pw.Text('Nama & Cap Perusahaan', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                    ],
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildMetaItem(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 100,
            child: pw.Text('$label:', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.grey800)),
          ),
          pw.Expanded(
            child: pw.Text(value, style: const pw.TextStyle(fontSize: 9)),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildCell(
    String text, {
    bool isHeader = false,
    pw.Alignment align = pw.Alignment.centerLeft,
    PdfColor textColor = PdfColors.black,
    bool isBold = false,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      alignment: align,
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 10 : 9,
          fontWeight: (isHeader || isBold) ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: isHeader ? PdfColors.white : textColor,
        ),
      ),
    );
  }
}
