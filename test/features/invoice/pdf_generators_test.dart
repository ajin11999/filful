import 'package:flutter_test/flutter_test.dart';
import 'package:filful/src/core/database/app_database.dart';
import 'package:filful/src/features/invoice/data/pdf_delivery_note_generator.dart';
import 'package:filful/src/features/invoice/data/pdf_invoice_generator.dart';

void main() {
  test('Generate Surat Jalan and Invoice PDFs successfully', () async {
    final po = PurchaseOrdersTableData(
      id: 'po-1',
      poNumber: '045/KAN/KTP/VIII/26-Rev 01',
      companyName: 'PT. KAYONG ALUMINIUM NUSANTARA',
      vendorName: 'Cahyadi',
      deliveryDestination: 'Kantor Perwakilan Ketapang',
      poDate: DateTime(2026, 8, 15),
      status: 'in_progress',
      subtotal: 11883000,
      discount: 0,
      tax: 0,
      grandTotal: 11883000,
      createdAt: DateTime.now(),
    );

    final batch = FulfillmentBatchesTableData(
      id: 'batch-1',
      poId: 'po-1',
      batchNumber: 'SJ-045/01',
      fulfillmentDate: DateTime.now(),
      status: 'in_progress',
      createdAt: DateTime.now(),
    );

    final poItem1 = PurchaseOrderItemsTableData(
      id: 'item-1',
      poId: 'po-1',
      itemIndex: 1,
      description: 'Asam Jawa Cup',
      requestedQty: 1.0,
      uom: 'Cup',
      targetUnitPrice: 25000,
      targetTotalPrice: 25000,
    );

    final fItem1 = FulfillmentItemsTableData(
      id: 'f-1',
      batchId: 'batch-1',
      poItemId: 'item-1',
      fulfilledQty: 1.0,
      billedUnitPrice: 25000,
      finalTotalPrice: 25000,
      status: 'fulfilled',
    );

    final items = [
      FulfillmentItemWithPoItem(fulfillmentItem: fItem1, poItem: poItem1),
    ];

    // Generate Surat Jalan
    final sjBytes = await PdfDeliveryNoteGenerator.generate(
      po: po,
      batch: batch,
      items: items,
    );
    expect(sjBytes, isNotEmpty);
    expect(sjBytes.length, greaterThan(1000));

    // Generate Invoice
    final invBytes = await PdfInvoiceGenerator.generate(
      po: po,
      batch: batch,
      items: items,
    );
    expect(invBytes, isNotEmpty);
    expect(invBytes.length, greaterThan(1000));
  });
}
