import 'dart:typed_data';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/database/app_database.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/terbilang.dart';

class PdfInvoiceGenerator {
  const PdfInvoiceGenerator();

  static Future<Uint8List> generate({
    required PurchaseOrdersTableData po,
    required FulfillmentBatchesTableData batch,
    required List<FulfillmentItemWithPoItem> items,
    String? bankName = 'BCA',
    String? bankAccountNumber = '123-456-7890',
    String? bankAccountName,
  }) async {
    await initializeDateFormatting('id_ID', null);
    final pdf = pw.Document();
    final dateFormat = DateFormat('dd MMMM yyyy', 'id_ID');

    final deliveredItems = items.where((i) => i.fulfillmentItem.fulfilledQty > 0).toList();
    final grandTotal = deliveredItems.fold(
        0.0, (sum, i) => sum + i.fulfillmentItem.finalTotalPrice);
    final vendorName = po.vendorName.isNotEmpty ? po.vendorName : 'Cahyadi';

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
                      vendorName,
                      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Pemasok Barang & Sembako',
                      style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
                    ),
                    if (po.vendorName.isNotEmpty)
                      pw.Text(
                        'Ketapang, Kalimantan Barat',
                        style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
                      ),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'FAKTUR INVOICE',
                      style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                    ),
                    pw.Text(
                      'No: INV/${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, '0')}/${po.poNumber.split('/').first}',
                      style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Tanggal: ${dateFormat.format(DateTime.now())}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            pw.Divider(thickness: 2, color: PdfColors.indigo900),
            pw.SizedBox(height: 8),

            // Bill To and Reff Box
            pw.Container(
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
                color: PdfColors.grey100,
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              ),
              child: pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('TAGIHAN KEPADA:', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.grey700)),
                        pw.SizedBox(height: 2),
                        pw.Text(po.companyName, style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
                        pw.Text(po.deliveryDestination, style: const pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 16),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('REFERENSI PO:', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.grey700)),
                        pw.SizedBox(height: 2),
                        pw.Text(po.poNumber, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text('Tanggal PO: ${dateFormat.format(po.poDate)}', style: const pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 12),

            // Line Items Table with Color Coding & Bold for Modified Qty/Price
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
              columnWidths: {
                0: const pw.FixedColumnWidth(24),
                1: const pw.FlexColumnWidth(4.5),
                2: const pw.FixedColumnWidth(46),
                3: const pw.FixedColumnWidth(36),
                4: const pw.FixedColumnWidth(75),
                5: const pw.FixedColumnWidth(80),
              },
              children: [
                // Header row
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.indigo900),
                  children: [
                    _buildCell('No', isHeader: true, align: pw.Alignment.center),
                    _buildCell('Keterangan Barang', isHeader: true, align: pw.Alignment.centerLeft),
                    _buildCell('Qty', isHeader: true, align: pw.Alignment.centerRight),
                    _buildCell('Satuan', isHeader: true, align: pw.Alignment.center),
                    _buildCell('Harga Satuan (Rp)', isHeader: true, align: pw.Alignment.centerRight),
                    _buildCell('Total (Rp)', isHeader: true, align: pw.Alignment.centerRight),
                  ],
                ),
                // Item rows
                ...deliveredItems.map((item) {
                  final poItem = item.poItem;
                  final fItem = item.fulfillmentItem;
                  final isQtyModified = (fItem.fulfilledQty - poItem.requestedQty).abs() > 0.001;
                  final isPriceModified = (fItem.billedUnitPrice - poItem.targetUnitPrice).abs() > 0.01;

                  final qtyText = isQtyModified
                      ? '${CurrencyFormatter.formatQty(fItem.fulfilledQty)} (PO:${CurrencyFormatter.formatQty(poItem.requestedQty)})'
                      : CurrencyFormatter.formatQty(fItem.fulfilledQty);

                  final priceText = isPriceModified
                      ? '${CurrencyFormatter.formatIdr(fItem.billedUnitPrice).replaceAll('Rp ', '')}\n[PO: ${CurrencyFormatter.formatIdr(poItem.targetUnitPrice).replaceAll('Rp ', '')}]'
                      : CurrencyFormatter.formatIdr(fItem.billedUnitPrice).replaceAll('Rp ', '');

                  final qtyBg = isQtyModified
                      ? (fItem.fulfilledQty < poItem.requestedQty ? PdfColors.red100 : PdfColors.green100)
                      : null;
                  final qtyColor = isQtyModified
                      ? (fItem.fulfilledQty < poItem.requestedQty ? PdfColors.red900 : PdfColors.green900)
                      : PdfColors.black;

                  final priceBg = isPriceModified ? PdfColors.amber100 : null;
                  final priceColor = isPriceModified ? PdfColors.amber900 : PdfColors.black;

                  return pw.TableRow(
                    children: [
                      _buildCell('${poItem.itemIndex}', align: pw.Alignment.center),
                      _buildCell(poItem.description, align: pw.Alignment.centerLeft),
                      // Qty Cell - High-visibility background badge & bold
                      _buildCell(
                        qtyText,
                        align: pw.Alignment.centerRight,
                        bgColor: qtyBg,
                        textColor: qtyColor,
                        isBold: isQtyModified,
                      ),
                      _buildCell(poItem.uom, align: pw.Alignment.center),
                      // Billed Unit Price Cell - High-visibility background badge & bold
                      _buildCell(
                        priceText,
                        align: pw.Alignment.centerRight,
                        bgColor: priceBg,
                        textColor: priceColor,
                        isBold: isPriceModified,
                      ),
                      // Total Price Cell - High-visibility background badge & bold
                      _buildCell(
                        CurrencyFormatter.formatIdr(fItem.finalTotalPrice).replaceAll('Rp ', ''),
                        align: pw.Alignment.centerRight,
                        bgColor: (isQtyModified || isPriceModified) ? PdfColors.blue50 : null,
                        textColor: (isQtyModified || isPriceModified) ? PdfColors.blue900 : PdfColors.black,
                        isBold: isQtyModified || isPriceModified,
                      ),
                    ],
                  );
                }),
              ],
            ),

            pw.SizedBox(height: 10),

            // Subtotal, Terbilang & Grand Total
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Left: Terbilang and Payment Info
                pw.Expanded(
                  flex: 6,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.grey100,
                          borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                          border: pw.Border.all(color: PdfColors.grey300),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('TERBILANG:', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold, color: PdfColors.grey700)),
                            pw.SizedBox(height: 2),
                            pw.Text(
                              Terbilang.convert(grandTotal),
                              style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold, fontStyle: pw.FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 8),
                      pw.Text('Pembayaran via Transfer Bank:', style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Bank: ${bankName ?? 'BCA'}', style: const pw.TextStyle(fontSize: 8.5)),
                      pw.Text('No. Rekening: ${bankAccountNumber ?? '123-456-7890'}', style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Atas Nama: ${bankAccountName ?? vendorName}', style: const pw.TextStyle(fontSize: 8.5)),
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                // Right: Grand Total Box
                pw.Expanded(
                  flex: 4,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.indigo50,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
                      border: pw.Border.all(color: PdfColors.indigo200),
                    ),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Subtotal:', style: const pw.TextStyle(fontSize: 9)),
                            pw.Text(CurrencyFormatter.formatIdr(grandTotal), style: const pw.TextStyle(fontSize: 9)),
                          ],
                        ),
                        pw.SizedBox(height: 4),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('PPN / Diskon:', style: const pw.TextStyle(fontSize: 9)),
                            pw.Text('Rp 0', style: const pw.TextStyle(fontSize: 9)),
                          ],
                        ),
                        pw.Divider(thickness: 0.8),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('TOTAL TAGIHAN:', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900)),
                            pw.Text(
                              CurrencyFormatter.formatIdr(grandTotal),
                              style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 20),

            // Signature
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Container(
                  width: 180,
                  child: pw.Column(
                    children: [
                      pw.Text('Hormat Kami,', style: const pw.TextStyle(fontSize: 9.5)),
                      pw.SizedBox(height: 48),
                      pw.Text('( $vendorName )', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      pw.Text('Pemasok / Supplier', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
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

  static pw.Widget _buildCell(
    String text, {
    bool isHeader = false,
    pw.Alignment align = pw.Alignment.centerLeft,
    PdfColor? bgColor,
    PdfColor textColor = PdfColors.black,
    bool isBold = false,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      alignment: align,
      decoration: bgColor != null
          ? pw.BoxDecoration(
              color: bgColor,
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
            )
          : null,
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 9.5 : (isBold ? 8.5 : 8.0),
          fontWeight: (isHeader || isBold) ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: isHeader ? PdfColors.white : textColor,
        ),
      ),
    );
  }
}
