import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'connection/open_connection.dart';
import 'tables/fulfillments.dart';
import 'tables/purchase_orders.dart';

part 'app_database.g.dart';

class FulfillmentItemWithPoItem {
  final FulfillmentItemsTableData fulfillmentItem;
  final PurchaseOrderItemsTableData poItem;

  const FulfillmentItemWithPoItem({
    required this.fulfillmentItem,
    required this.poItem,
  });

  bool get isFulfilled => fulfillmentItem.status == 'fulfilled';
  bool get isPartial => fulfillmentItem.status == 'partial';
  bool get isOutOfStock => fulfillmentItem.status == 'out_of_stock';
  bool get isPending => fulfillmentItem.status == 'pending';
}

class PoProgressSummary {
  final int totalItems;
  final int fulfilledItems;
  final int partialItems;
  final int outOfStockItems;
  final int pendingItems;
  final double totalBilledAmount;
  final double totalTargetAmount;
  final double totalPurchaseCost; // Modal

  const PoProgressSummary({
    required this.totalItems,
    required this.fulfilledItems,
    required this.partialItems,
    required this.outOfStockItems,
    required this.pendingItems,
    required this.totalBilledAmount,
    required this.totalTargetAmount,
    required this.totalPurchaseCost,
  });

  double get progressPercentage =>
      totalItems > 0 ? (fulfilledItems / totalItems).clamp(0.0, 1.0) : 0.0;

  double get grossMargin => totalBilledAmount - totalPurchaseCost;
  double get grossMarginPercentage =>
      totalBilledAmount > 0 ? (grossMargin / totalBilledAmount) * 100 : 0.0;
}

@DriftDatabase(tables: [
  PurchaseOrdersTable,
  PurchaseOrderItemsTable,
  FulfillmentBatchesTable,
  FulfillmentItemsTable,
  InvoicesTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? openConnection());

  @override
  int get schemaVersion => 1;

  // --- Purchase Orders Queries ---

  Stream<List<PurchaseOrdersTableData>> watchAllPurchaseOrders() {
    return (select(purchaseOrdersTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Future<PurchaseOrdersTableData?> getPurchaseOrderById(String id) {
    return (select(purchaseOrdersTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<List<PurchaseOrderItemsTableData>> watchPoItems(String poId) {
    return (select(purchaseOrderItemsTable)
          ..where((t) => t.poId.equals(poId))
          ..orderBy([(t) => OrderingTerm.asc(t.itemIndex)]))
        .watch();
  }

  // --- Ingestion Insertion ---

  Future<String> insertPoWithItems({
    required String poNumber,
    required String companyName,
    required String vendorName,
    required String deliveryDestination,
    required DateTime poDate,
    DateTime? deliveryDate,
    required double subtotal,
    required double discount,
    required double tax,
    required double grandTotal,
    String? notes,
    required List<({
      int itemIndex,
      String description,
      double requestedQty,
      String uom,
      double targetUnitPrice,
      double targetTotalPrice,
      String? category,
    })> items,
  }) async {
    const uuid = Uuid();
    final poId = uuid.v4();

    await transaction(() async {
      await into(purchaseOrdersTable).insert(
        PurchaseOrdersTableCompanion.insert(
          id: poId,
          poNumber: poNumber,
          companyName: Value(companyName),
          vendorName: Value(vendorName),
          deliveryDestination: Value(deliveryDestination),
          poDate: poDate,
          deliveryDate: Value(deliveryDate),
          status: const Value('draft'),
          subtotal: Value(subtotal),
          discount: Value(discount),
          tax: Value(tax),
          grandTotal: Value(grandTotal),
          notes: Value(notes),
        ),
      );

      final poItemCompanions = items.map((item) {
        return PurchaseOrderItemsTableCompanion.insert(
          id: uuid.v4(),
          poId: poId,
          itemIndex: item.itemIndex,
          description: item.description,
          requestedQty: item.requestedQty,
          uom: Value(item.uom),
          targetUnitPrice: item.targetUnitPrice,
          targetTotalPrice: item.targetTotalPrice,
          category: Value(item.category),
        );
      }).toList();

      for (final companion in poItemCompanions) {
        await into(purchaseOrderItemsTable).insert(companion);
      }

      // Automatically create the initial fulfillment batch
      await createInitialBatchForPo(poId);
    });

    return poId;
  }

  // --- Fulfillment Batch Queries & Operations ---

  Future<FulfillmentBatchesTableData> createInitialBatchForPo(String poId) async {
    const uuid = Uuid();
    final batchId = uuid.v4();
    final po = await (select(purchaseOrdersTable)..where((t) => t.id.equals(poId))).getSingle();
    final poItems = await (select(purchaseOrderItemsTable)
          ..where((t) => t.poId.equals(poId))
          ..orderBy([(t) => OrderingTerm.asc(t.itemIndex)]))
        .get();

    final batchCompanion = FulfillmentBatchesTableCompanion.insert(
      id: batchId,
      poId: poId,
      batchNumber: 'SJ-${po.poNumber.replaceAll('/', '-').split('-').first}/01',
      deliveryNoteNumber: Value('SJ/${DateTime.now().year}/${DateTime.now().month}/${po.poNumber.split('/').first}'),
      fulfillmentDate: const Value.absent(),
      status: const Value('in_progress'),
    );

    await into(fulfillmentBatchesTable).insert(batchCompanion);

    // Populate initial fulfillment items
    for (final item in poItems) {
      await into(fulfillmentItemsTable).insert(
        FulfillmentItemsTableCompanion.insert(
          id: uuid.v4(),
          batchId: batchId,
          poItemId: item.id,
          fulfilledQty: const Value(0.0),
          billedUnitPrice: Value(item.targetUnitPrice),
          purchaseCostPrice: const Value(null),
          finalTotalPrice: const Value(0.0),
          status: const Value('pending'),
        ),
      );
    }

    return (select(fulfillmentBatchesTable)..where((t) => t.id.equals(batchId))).getSingle();
  }

  Stream<FulfillmentBatchesTableData?> watchActiveBatchForPo(String poId) {
    return (select(fulfillmentBatchesTable)
          ..where((t) => t.poId.equals(poId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .watchSingleOrNull();
  }

  Stream<List<FulfillmentItemWithPoItem>> watchBatchItems(String batchId) {
    final query = select(fulfillmentItemsTable).join([
      innerJoin(
        purchaseOrderItemsTable,
        purchaseOrderItemsTable.id.equalsExp(fulfillmentItemsTable.poItemId),
      ),
    ])
      ..where(fulfillmentItemsTable.batchId.equals(batchId))
      ..orderBy([OrderingTerm.asc(purchaseOrderItemsTable.itemIndex)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return FulfillmentItemWithPoItem(
          fulfillmentItem: row.readTable(fulfillmentItemsTable),
          poItem: row.readTable(purchaseOrderItemsTable),
        );
      }).toList();
    });
  }

  Future<void> updateFulfillmentItem({
    required String fulfillmentItemId,
    required double fulfilledQty,
    required double billedUnitPrice,
    double? purchaseCostPrice,
    required String status,
    String? note,
  }) async {
    final finalTotalPrice = fulfilledQty * billedUnitPrice;
    await (update(fulfillmentItemsTable)..where((t) => t.id.equals(fulfillmentItemId))).write(
      FulfillmentItemsTableCompanion(
        fulfilledQty: Value(fulfilledQty),
        billedUnitPrice: Value(billedUnitPrice),
        purchaseCostPrice: Value(purchaseCostPrice),
        finalTotalPrice: Value(finalTotalPrice),
        status: Value(status),
        note: Value(note),
      ),
    );
  }

  Future<void> fulfillSingleItemAsOrdered({
    required String fulfillmentItemId,
    required double requestedQty,
    required double targetUnitPrice,
    double? purchaseCostPrice,
  }) async {
    await updateFulfillmentItem(
      fulfillmentItemId: fulfillmentItemId,
      fulfilledQty: requestedQty,
      billedUnitPrice: targetUnitPrice,
      purchaseCostPrice: purchaseCostPrice,
      status: 'fulfilled',
    );
  }

  Future<void> fulfillPendingExactForBatch(String batchId) async {
    final items = await (select(fulfillmentItemsTable).join([
      innerJoin(
        purchaseOrderItemsTable,
        purchaseOrderItemsTable.id.equalsExp(fulfillmentItemsTable.poItemId),
      ),
    ])
          ..where(fulfillmentItemsTable.batchId.equals(batchId))
          ..where(fulfillmentItemsTable.status.equals('pending')))
        .get();

    await transaction(() async {
      for (final row in items) {
        final fItem = row.readTable(fulfillmentItemsTable);
        final poItem = row.readTable(purchaseOrderItemsTable);

        await (update(fulfillmentItemsTable)..where((t) => t.id.equals(fItem.id))).write(
          FulfillmentItemsTableCompanion(
            fulfilledQty: Value(poItem.requestedQty),
            billedUnitPrice: Value(poItem.targetUnitPrice),
            finalTotalPrice: Value(poItem.targetTotalPrice),
            status: const Value('fulfilled'),
          ),
        );
      }
    });
  }

  Future<void> fulfillAllExactForBatch(String batchId) async {
    final items = await (select(fulfillmentItemsTable).join([
      innerJoin(
        purchaseOrderItemsTable,
        purchaseOrderItemsTable.id.equalsExp(fulfillmentItemsTable.poItemId),
      ),
    ])..where(fulfillmentItemsTable.batchId.equals(batchId))).get();

    await transaction(() async {
      for (final row in items) {
        final fItem = row.readTable(fulfillmentItemsTable);
        final poItem = row.readTable(purchaseOrderItemsTable);

        await (update(fulfillmentItemsTable)..where((t) => t.id.equals(fItem.id))).write(
          FulfillmentItemsTableCompanion(
            fulfilledQty: Value(poItem.requestedQty),
            billedUnitPrice: Value(poItem.targetUnitPrice),
            finalTotalPrice: Value(poItem.targetTotalPrice),
            status: const Value('fulfilled'),
          ),
        );
      }
    });
  }

  Future<void> deletePurchaseOrder(String poId) async {
    await (delete(purchaseOrdersTable)..where((t) => t.id.equals(poId))).go();
  }
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
