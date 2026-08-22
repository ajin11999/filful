import 'dart:ffi';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:filful/src/core/database/app_database.dart';
import 'package:sqlite3/open.dart';

void main() {
  late AppDatabase db;

  setUpAll(() {
    if (Platform.isLinux) {
      open.overrideFor(OperatingSystem.linux, () {
        try {
          return DynamicLibrary.open('libsqlite3.so.0');
        } catch (_) {
          return DynamicLibrary.open('/usr/lib/x86_64-linux-gnu/libsqlite3.so.0');
        }
      });
    }
  });

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('Insert PO, create batch, update fulfillment items and calculate margins', () async {
    final poId = await db.insertPoWithItems(
      poNumber: '045/KAN/KTP/VIII/26-Rev 01',
      companyName: 'PT. KAYONG ALUMINIUM NUSANTARA',
      vendorName: 'Cahyadi',
      deliveryDestination: 'Kantor Perwakilan Ketapang',
      poDate: DateTime(2026, 8, 15),
      deliveryDate: DateTime(2026, 8, 20),
      subtotal: 11883000,
      discount: 0,
      tax: 0,
      grandTotal: 11883000,
      items: [
        (
          itemIndex: 1,
          description: 'Asam Jawa Cup',
          requestedQty: 1.0,
          uom: 'Cup',
          targetUnitPrice: 25000.0,
          targetTotalPrice: 25000.0,
          category: null,
        ),
        (
          itemIndex: 2,
          description: 'Ayam Potong',
          requestedQty: 50.0,
          uom: 'Kg',
          targetUnitPrice: 42000.0,
          targetTotalPrice: 2100000.0,
          category: null,
        ),
      ],
    );

    expect(poId, isNotEmpty);

    // Verify PO retrieved
    final po = await db.getPurchaseOrderById(poId);
    expect(po, isNotNull);
    expect(po!.poNumber, '045/KAN/KTP/VIII/26-Rev 01');

    // Verify Batch created
    final batch = await db.watchActiveBatchForPo(poId).first;
    expect(batch, isNotNull);

    // Verify Batch items
    final batchItems = await db.watchBatchItems(batch!.id).first;
    expect(batchItems.length, 2);
    expect(batchItems[0].poItem.description, 'Asam Jawa Cup');
    expect(batchItems[0].fulfillmentItem.status, 'pending');

    // Fulfill item 1 as ordered with modal cost
    await db.fulfillSingleItemAsOrdered(
      fulfillmentItemId: batchItems[0].fulfillmentItem.id,
      requestedQty: 1.0,
      targetUnitPrice: 25000.0,
      purchaseCostPrice: 20000.0,
    );

    final updatedItems = await db.watchBatchItems(batch.id).first;
    expect(updatedItems[0].isFulfilled, isTrue);
    expect(updatedItems[0].fulfillmentItem.finalTotalPrice, 25000.0);
    expect(updatedItems[0].fulfillmentItem.purchaseCostPrice, 20000.0);
  });
}
