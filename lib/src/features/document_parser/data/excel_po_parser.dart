import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';

import '../domain/parsed_po.dart';

class ExcelPoParser {
  const ExcelPoParser();

  Future<ParsedPo> parseFile(File file) async {
    final bytes = await file.readAsBytes();
    return parseBytes(bytes);
  }

  ParsedPo parseBytes(Uint8List bytes) {
    final excel = Excel.decodeBytes(bytes);
    final sheet = excel.tables[excel.tables.keys.first];

    String poNumber = 'PO-${DateTime.now().millisecondsSinceEpoch}';
    String companyName = 'Perusahaan';
    String vendorName = 'Vendor';
    String vendorAddress = '';
    String deliveryDestination = '';
    DateTime poDate = DateTime.now();

    final List<ParsedPoItem> items = [];
    if (sheet != null) {
      for (int rowIndex = 0; rowIndex < sheet.rows.length; rowIndex++) {
        final row = sheet.rows[rowIndex];
        if (row.isEmpty) continue;

        final rowValues = row.map((cell) => cell?.value?.toString().trim() ?? '').toList();

        // Check header keys
        for (int c = 0; c < rowValues.length; c++) {
          final cellText = rowValues[c].toLowerCase();
          if (cellText.contains('no. po') || cellText.contains('nomor po')) {
            if (c + 1 < rowValues.length && rowValues[c + 1].isNotEmpty) {
              poNumber = rowValues[c + 1];
            }
          }
          if (cellText.startsWith('pt.') || cellText.startsWith('pt ')) {
            companyName = rowValues[c];
          }
        }

        // Check table row with item index or numeric first col
        if (rowValues.length >= 5) {
          final firstVal = int.tryParse(rowValues[0]);
          if (firstVal != null && firstVal > 0) {
            final desc = rowValues[1];
            final qty = double.tryParse(rowValues[2].replaceAll(',', '.')) ?? 1.0;
            final uom = rowValues[3].isNotEmpty ? rowValues[3] : 'Pcs';
            final unitPrice = double.tryParse(
                    rowValues[4].replaceAll(RegExp(r'[^0-9.]'), '')) ??
                0.0;
            final totalPrice = rowValues.length > 5
                ? (double.tryParse(
                        rowValues[5].replaceAll(RegExp(r'[^0-9.]'), '')) ??
                    (qty * unitPrice))
                : (qty * unitPrice);

            if (desc.isNotEmpty && unitPrice > 0) {
              items.add(
                ParsedPoItem(
                  itemIndex: firstVal,
                  description: desc,
                  requestedQty: qty,
                  uom: uom,
                  targetUnitPrice: unitPrice,
                  targetTotalPrice: totalPrice,
                ),
              );
            }
          }
        }
      }
    }

    final subtotal = items.fold(0.0, (sum, i) => sum + i.targetTotalPrice);

    return ParsedPo(
      poNumber: poNumber,
      companyName: companyName,
      vendorName: vendorName,
      vendorAddress: vendorAddress,
      deliveryDestination: deliveryDestination,
      poDate: poDate,
      subtotal: subtotal,
      discount: 0.0,
      tax: 0.0,
      grandTotal: subtotal,
      items: items,
    );
  }
}
