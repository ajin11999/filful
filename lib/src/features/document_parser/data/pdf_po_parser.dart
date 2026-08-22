import 'dart:io';
import 'dart:typed_data';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../domain/parsed_po.dart';

class PdfPoParser {
  const PdfPoParser();

  static const Map<String, int> _indoMonths = {
    'januari': 1,
    'jan': 1,
    'februari': 2,
    'feb': 2,
    'maret': 3,
    'mar': 3,
    'april': 4,
    'apr': 4,
    'mei': 5,
    'juni': 6,
    'jun': 6,
    'juli': 7,
    'jul': 7,
    'agustus': 8,
    'ags': 8,
    'agt': 8,
    'september': 9,
    'sep': 9,
    'oktober': 10,
    'okt': 10,
    'november': 11,
    'nov': 11,
    'desember': 12,
    'des': 12,
  };

  Future<ParsedPo> parseFile(File file) async {
    final bytes = await file.readAsBytes();
    return parseBytes(bytes);
  }

  ParsedPo parseBytes(Uint8List bytes) {
    final document = PdfDocument(inputBytes: bytes);
    final extractor = PdfTextExtractor(document);

    final StringBuffer fullTextBuffer = StringBuffer();
    for (int i = 0; i < document.pages.count; i++) {
      final pageText = extractor.extractText(startPageIndex: i, endPageIndex: i);
      fullTextBuffer.writeln(pageText);
    }
    document.dispose();

    final fullText = fullTextBuffer.toString();
    return _parseText(fullText);
  }

  ParsedPo _parseText(String text) {
    // 1. PO Number
    String poNumber = 'PO-${DateTime.now().millisecondsSinceEpoch}';
    final poNumMatch = RegExp(r'No\.?\s*PO\s*\n\s*([^\n\r]+)', caseSensitive: false).firstMatch(text);
    if (poNumMatch != null && poNumMatch.group(1) != null) {
      poNumber = poNumMatch.group(1)!.trim();
    }

    // 2. Company Name
    String companyName = 'Perusahaan';
    final companyMatch = RegExp(r'(PT\.?\s+[A-Z0-9\s\.,]+)', caseSensitive: true).firstMatch(text);
    if (companyMatch != null && companyMatch.group(1) != null) {
      companyName = companyMatch.group(1)!.trim();
    }

    // 3. Vendor Name & Address
    String vendorName = 'Vendor';
    final vendorMatch = RegExp(r'INFORMASI\s+VENDOR\s*\n\s*([^\n\r]+)', caseSensitive: false).firstMatch(text);
    if (vendorMatch != null && vendorMatch.group(1) != null) {
      vendorName = vendorMatch.group(1)!.trim();
    }

    String vendorAddress = '';
    final addressMatch = RegExp(r'ALAMAT\s*\n\s*([^\n\r]+)', caseSensitive: false).firstMatch(text);
    if (addressMatch != null && addressMatch.group(1) != null) {
      vendorAddress = addressMatch.group(1)!.trim();
    }

    // 4. Delivery Destination
    String deliveryDestination = '';
    final destMatch = RegExp(r'Tujuan\s+Pengiriman\s*\n\s*([^\n\r]+)', caseSensitive: false).firstMatch(text);
    if (destMatch != null && destMatch.group(1) != null) {
      deliveryDestination = destMatch.group(1)!.trim();
    }

    // 5. Reference PRO
    String? referencePro;
    final reffMatch = RegExp(r'Reff\s+PRO\s*\n\s*([^\n\r]+)', caseSensitive: false).firstMatch(text);
    if (reffMatch != null && reffMatch.group(1) != null) {
      referencePro = reffMatch.group(1)!.trim();
    }

    // 6. PO Date & Delivery Date
    DateTime poDate = DateTime.now();
    final dateMatch = RegExp(r'Tanggal\s*\n\s*([0-9]{1,2}\s+[A-Za-z]+\s+[0-9]{4})', caseSensitive: false).firstMatch(text);
    if (dateMatch != null && dateMatch.group(1) != null) {
      poDate = _parseIndonesianDate(dateMatch.group(1)!) ?? DateTime.now();
    }

    DateTime? deliveryDate;
    final delivDateMatch = RegExp(r'Tanggal\s+Pengiriman\s*\n\s*([0-9]{1,2}\s+[A-Za-z]+\s+[0-9]{4})', caseSensitive: false).firstMatch(text);
    if (delivDateMatch != null && delivDateMatch.group(1) != null) {
      deliveryDate = _parseIndonesianDate(delivDateMatch.group(1)!);
    }

    // 7. Line Items Parser
    final List<ParsedPoItem> items = _extractLineItems(text);

    // 8. Totals
    double subtotal = 0.0;
    double grandTotal = 0.0;

    final subtotalMatch = RegExp(r'Subtotal\s*\n\s*([\d,\.]+)\s*\n\s*Rp', caseSensitive: false).firstMatch(text);
    if (subtotalMatch != null && subtotalMatch.group(1) != null) {
      subtotal = _parseAmount(subtotalMatch.group(1)!);
    }

    final totalMatch = RegExp(r'Total\s*\n\s*([\d,\.]+)\s*\n\s*Rp', caseSensitive: false).firstMatch(text);
    if (totalMatch != null && totalMatch.group(1) != null) {
      grandTotal = _parseAmount(totalMatch.group(1)!);
    }

    if (subtotal == 0.0 && items.isNotEmpty) {
      subtotal = items.fold(0.0, (sum, item) => sum + item.targetTotalPrice);
    }
    if (grandTotal == 0.0) {
      grandTotal = subtotal;
    }

    return ParsedPo(
      poNumber: poNumber,
      companyName: companyName,
      vendorName: vendorName,
      vendorAddress: vendorAddress,
      deliveryDestination: deliveryDestination,
      referencePro: referencePro,
      poDate: poDate,
      deliveryDate: deliveryDate,
      subtotal: subtotal,
      discount: 0.0,
      tax: 0.0,
      grandTotal: grandTotal,
      notes: null,
      items: items,
    );
  }

  List<ParsedPoItem> _extractLineItems(String text) {
    final List<ParsedPoItem> items = [];
    final lines = text.split(RegExp(r'[\r\n]+')).map((l) => l.trim()).where((l) => l.isNotEmpty).toList();

    int i = 0;
    while (i < lines.length) {
      final line = lines[i];

      // Check if line is an integer index (1, 2, 3, etc.)
      final itemIndex = int.tryParse(line);
      if (itemIndex != null && itemIndex == items.length + 1) {
        // We found the next sequential item!
        // Expected next tokens:
        // lines[i+1]: Description (e.g. Asam Jawa Cup)
        // lines[i+2]: Qty (e.g. 1, 50, 1.5, 3.5)
        // lines[i+3]: UOM (e.g. Cup, Kg, Krg, Bks, Ikat, Ea, etc.)
        // lines[i+4]: Unit Price (e.g. 25,000)
        // lines[i+5]: 'Rp'
        // lines[i+6]: Total Price (e.g. 25,000)
        // lines[i+7]: 'Rp'
        if (i + 6 < lines.length) {
          final desc = lines[i + 1];
          final qtyStr = lines[i + 2];
          final uom = lines[i + 3];
          final unitPriceStr = lines[i + 4];
          final totalPriceStr = lines[i + 6];

          final qty = double.tryParse(qtyStr.replaceAll(',', '.'));
          final unitPrice = _parseAmount(unitPriceStr);
          final totalPrice = _parseAmount(totalPriceStr);

          if (qty != null && unitPrice > 0) {
            items.add(
              ParsedPoItem(
                itemIndex: itemIndex,
                description: desc,
                requestedQty: qty,
                uom: uom,
                targetUnitPrice: unitPrice,
                targetTotalPrice: totalPrice > 0 ? totalPrice : (qty * unitPrice),
              ),
            );
            i += 7;
            continue;
          }
        }
      }
      i++;
    }

    return items;
  }

  DateTime? _parseIndonesianDate(String dateStr) {
    try {
      final parts = dateStr.trim().split(RegExp(r'\s+'));
      if (parts.length >= 3) {
        final day = int.tryParse(parts[0]);
        final monthStr = parts[1].toLowerCase();
        final year = int.tryParse(parts[2]);

        final month = _indoMonths[monthStr];
        if (day != null && month != null && year != null) {
          return DateTime(year, month, day);
        }
      }
    } catch (_) {}
    return null;
  }

  double _parseAmount(String val) {
    try {
      final clean = val.replaceAll('Rp', '').replaceAll(' ', '').replaceAll(',', '');
      return double.tryParse(clean) ?? 0.0;
    } catch (_) {
      return 0.0;
    }
  }
}
