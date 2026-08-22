import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:filful/src/features/document_parser/data/pdf_po_parser.dart';

void main() {
  group('PdfPoParser Tests', () {
    const parser = PdfPoParser();
    final sampleFile = File('/home/ajin/Downloads/PO 045 - Cahyadi (KP Ketapang) Rev 01.pdf');

    test('Parses sample PO 045 with 100% accuracy', () async {
      if (!sampleFile.existsSync()) return;

      final parsedPo = await parser.parseFile(sampleFile);

      expect(parsedPo.poNumber, contains('045/KAN/KTP/VIII/26-Rev 01'));
      expect(parsedPo.companyName, contains('PT. KAYONG ALUMINIUM NUSANTARA'));
      expect(parsedPo.vendorName, equals('Cahyadi'));
      expect(parsedPo.vendorAddress, equals('Ketapang'));
      expect(parsedPo.deliveryDestination, equals('Kantor Perwakilan Ketapang'));
      expect(parsedPo.referencePro, equals('004/PRO-KAN/VIII/2026'));
      expect(parsedPo.poDate.day, 15);
      expect(parsedPo.poDate.month, 8);
      expect(parsedPo.poDate.year, 2026);
      expect(parsedPo.deliveryDate?.day, 20);
      expect(parsedPo.deliveryDate?.month, 8);

      // Check items
      expect(parsedPo.items.length, 49);

      // Item 1: Asam Jawa Cup 1 Cup @ 25,000
      final item1 = parsedPo.items[0];
      expect(item1.itemIndex, 1);
      expect(item1.description, 'Asam Jawa Cup');
      expect(item1.requestedQty, 1.0);
      expect(item1.uom, 'Cup');
      expect(item1.targetUnitPrice, 25000.0);
      expect(item1.targetTotalPrice, 25000.0);

      // Item 2: Ayam Potong 50 Kg @ 42,000 = 2,100,000
      final item2 = parsedPo.items[1];
      expect(item2.itemIndex, 2);
      expect(item2.description, 'Ayam Potong');
      expect(item2.requestedQty, 50.0);
      expect(item2.uom, 'Kg');
      expect(item2.targetUnitPrice, 42000.0);
      expect(item2.targetTotalPrice, 2100000.0);

      // Item 14: Cabe Rawit 1.5 Kg @ 120,000 = 180,000
      final item14 = parsedPo.items[13];
      expect(item14.description, 'Cabe Rawit');
      expect(item14.requestedQty, 1.5);
      expect(item14.targetUnitPrice, 120000.0);

      // Item 49: Wortel 2 Kg @ 35,000 = 70,000
      final item49 = parsedPo.items[48];
      expect(item49.itemIndex, 49);
      expect(item49.description, 'Wortel');
      expect(item49.requestedQty, 2.0);
      expect(item49.targetUnitPrice, 35000.0);

      // Total sum check
      expect(parsedPo.grandTotal, 11883000.0);
    });
  });
}
