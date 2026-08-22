import 'package:drift/drift.dart';
import 'purchase_orders.dart';

class FulfillmentBatchesTable extends Table {
  TextColumn get id => text()();
  TextColumn get poId => text().references(PurchaseOrdersTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get batchNumber => text()(); // e.g. SJ-045/01
  TextColumn get deliveryNoteNumber => text().nullable()();
  DateTimeColumn get fulfillmentDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('in_progress'))(); // in_progress, completed
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class FulfillmentItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(FulfillmentBatchesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get poItemId => text().references(PurchaseOrderItemsTable, #id, onDelete: KeyAction.cascade)();
  RealColumn get fulfilledQty => real().withDefault(const Constant(0.0))();
  RealColumn get billedUnitPrice => real().withDefault(const Constant(0.0))();
  RealColumn get purchaseCostPrice => real().nullable()(); // Middleman Modal (Cost Price)
  RealColumn get finalTotalPrice => real().withDefault(const Constant(0.0))();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, fulfilled, partial, out_of_stock, substituted
  TextColumn get note => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class InvoicesTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(FulfillmentBatchesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get poId => text().references(PurchaseOrdersTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get invoiceNumber => text()(); // e.g. INV-045/01
  DateTimeColumn get invoiceDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get grandTotal => real().withDefault(const Constant(0.0))();
  TextColumn get bankAccountName => text().nullable()();
  TextColumn get bankAccountNumber => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get paymentTerms => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
