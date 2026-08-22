import 'package:drift/drift.dart';

class PurchaseOrdersTable extends Table {
  TextColumn get id => text()();
  TextColumn get poNumber => text()();
  TextColumn get companyName => text().withDefault(const Constant(''))();
  TextColumn get vendorName => text().withDefault(const Constant(''))();
  TextColumn get deliveryDestination => text().withDefault(const Constant(''))();
  DateTimeColumn get poDate => dateTime()();
  DateTimeColumn get deliveryDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('draft'))(); // draft, in_progress, fulfilled, closed
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get grandTotal => real().withDefault(const Constant(0.0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class PurchaseOrderItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get poId => text().references(PurchaseOrdersTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get itemIndex => integer()();
  TextColumn get description => text()();
  RealColumn get requestedQty => real()();
  TextColumn get uom => text().withDefault(const Constant('Pcs'))(); // Kg, Bks, Ea, etc.
  RealColumn get targetUnitPrice => real()();
  RealColumn get targetTotalPrice => real()();
  TextColumn get category => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
