// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PurchaseOrdersTableTable extends PurchaseOrdersTable
    with TableInfo<$PurchaseOrdersTableTable, PurchaseOrdersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poNumberMeta = const VerificationMeta(
    'poNumber',
  );
  @override
  late final GeneratedColumn<String> poNumber = GeneratedColumn<String>(
    'po_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _vendorNameMeta = const VerificationMeta(
    'vendorName',
  );
  @override
  late final GeneratedColumn<String> vendorName = GeneratedColumn<String>(
    'vendor_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _deliveryDestinationMeta =
      const VerificationMeta('deliveryDestination');
  @override
  late final GeneratedColumn<String> deliveryDestination =
      GeneratedColumn<String>(
        'delivery_destination',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _poDateMeta = const VerificationMeta('poDate');
  @override
  late final GeneratedColumn<DateTime> poDate = GeneratedColumn<DateTime>(
    'po_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryDateMeta = const VerificationMeta(
    'deliveryDate',
  );
  @override
  late final GeneratedColumn<DateTime> deliveryDate = GeneratedColumn<DateTime>(
    'delivery_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double> tax = GeneratedColumn<double>(
    'tax',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poNumber,
    companyName,
    vendorName,
    deliveryDestination,
    poDate,
    deliveryDate,
    status,
    subtotal,
    discount,
    tax,
    grandTotal,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_orders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseOrdersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('po_number')) {
      context.handle(
        _poNumberMeta,
        poNumber.isAcceptableOrUnknown(data['po_number']!, _poNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_poNumberMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    }
    if (data.containsKey('vendor_name')) {
      context.handle(
        _vendorNameMeta,
        vendorName.isAcceptableOrUnknown(data['vendor_name']!, _vendorNameMeta),
      );
    }
    if (data.containsKey('delivery_destination')) {
      context.handle(
        _deliveryDestinationMeta,
        deliveryDestination.isAcceptableOrUnknown(
          data['delivery_destination']!,
          _deliveryDestinationMeta,
        ),
      );
    }
    if (data.containsKey('po_date')) {
      context.handle(
        _poDateMeta,
        poDate.isAcceptableOrUnknown(data['po_date']!, _poDateMeta),
      );
    } else if (isInserting) {
      context.missing(_poDateMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
        _deliveryDateMeta,
        deliveryDate.isAcceptableOrUnknown(
          data['delivery_date']!,
          _deliveryDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('tax')) {
      context.handle(
        _taxMeta,
        tax.isAcceptableOrUnknown(data['tax']!, _taxMeta),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrdersTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrdersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}po_number'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      )!,
      vendorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor_name'],
      )!,
      deliveryDestination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_destination'],
      )!,
      poDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}po_date'],
      )!,
      deliveryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delivery_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      tax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grand_total'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PurchaseOrdersTableTable createAlias(String alias) {
    return $PurchaseOrdersTableTable(attachedDatabase, alias);
  }
}

class PurchaseOrdersTableData extends DataClass
    implements Insertable<PurchaseOrdersTableData> {
  final String id;
  final String poNumber;
  final String companyName;
  final String vendorName;
  final String deliveryDestination;
  final DateTime poDate;
  final DateTime? deliveryDate;
  final String status;
  final double subtotal;
  final double discount;
  final double tax;
  final double grandTotal;
  final String? notes;
  final DateTime createdAt;
  const PurchaseOrdersTableData({
    required this.id,
    required this.poNumber,
    required this.companyName,
    required this.vendorName,
    required this.deliveryDestination,
    required this.poDate,
    this.deliveryDate,
    required this.status,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.grandTotal,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['po_number'] = Variable<String>(poNumber);
    map['company_name'] = Variable<String>(companyName);
    map['vendor_name'] = Variable<String>(vendorName);
    map['delivery_destination'] = Variable<String>(deliveryDestination);
    map['po_date'] = Variable<DateTime>(poDate);
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    map['status'] = Variable<String>(status);
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['tax'] = Variable<double>(tax);
    map['grand_total'] = Variable<double>(grandTotal);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PurchaseOrdersTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrdersTableCompanion(
      id: Value(id),
      poNumber: Value(poNumber),
      companyName: Value(companyName),
      vendorName: Value(vendorName),
      deliveryDestination: Value(deliveryDestination),
      poDate: Value(poDate),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      status: Value(status),
      subtotal: Value(subtotal),
      discount: Value(discount),
      tax: Value(tax),
      grandTotal: Value(grandTotal),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PurchaseOrdersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrdersTableData(
      id: serializer.fromJson<String>(json['id']),
      poNumber: serializer.fromJson<String>(json['poNumber']),
      companyName: serializer.fromJson<String>(json['companyName']),
      vendorName: serializer.fromJson<String>(json['vendorName']),
      deliveryDestination: serializer.fromJson<String>(
        json['deliveryDestination'],
      ),
      poDate: serializer.fromJson<DateTime>(json['poDate']),
      deliveryDate: serializer.fromJson<DateTime?>(json['deliveryDate']),
      status: serializer.fromJson<String>(json['status']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      tax: serializer.fromJson<double>(json['tax']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poNumber': serializer.toJson<String>(poNumber),
      'companyName': serializer.toJson<String>(companyName),
      'vendorName': serializer.toJson<String>(vendorName),
      'deliveryDestination': serializer.toJson<String>(deliveryDestination),
      'poDate': serializer.toJson<DateTime>(poDate),
      'deliveryDate': serializer.toJson<DateTime?>(deliveryDate),
      'status': serializer.toJson<String>(status),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'tax': serializer.toJson<double>(tax),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PurchaseOrdersTableData copyWith({
    String? id,
    String? poNumber,
    String? companyName,
    String? vendorName,
    String? deliveryDestination,
    DateTime? poDate,
    Value<DateTime?> deliveryDate = const Value.absent(),
    String? status,
    double? subtotal,
    double? discount,
    double? tax,
    double? grandTotal,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => PurchaseOrdersTableData(
    id: id ?? this.id,
    poNumber: poNumber ?? this.poNumber,
    companyName: companyName ?? this.companyName,
    vendorName: vendorName ?? this.vendorName,
    deliveryDestination: deliveryDestination ?? this.deliveryDestination,
    poDate: poDate ?? this.poDate,
    deliveryDate: deliveryDate.present ? deliveryDate.value : this.deliveryDate,
    status: status ?? this.status,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    tax: tax ?? this.tax,
    grandTotal: grandTotal ?? this.grandTotal,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PurchaseOrdersTableData copyWithCompanion(PurchaseOrdersTableCompanion data) {
    return PurchaseOrdersTableData(
      id: data.id.present ? data.id.value : this.id,
      poNumber: data.poNumber.present ? data.poNumber.value : this.poNumber,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      vendorName: data.vendorName.present
          ? data.vendorName.value
          : this.vendorName,
      deliveryDestination: data.deliveryDestination.present
          ? data.deliveryDestination.value
          : this.deliveryDestination,
      poDate: data.poDate.present ? data.poDate.value : this.poDate,
      deliveryDate: data.deliveryDate.present
          ? data.deliveryDate.value
          : this.deliveryDate,
      status: data.status.present ? data.status.value : this.status,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      tax: data.tax.present ? data.tax.value : this.tax,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrdersTableData(')
          ..write('id: $id, ')
          ..write('poNumber: $poNumber, ')
          ..write('companyName: $companyName, ')
          ..write('vendorName: $vendorName, ')
          ..write('deliveryDestination: $deliveryDestination, ')
          ..write('poDate: $poDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    poNumber,
    companyName,
    vendorName,
    deliveryDestination,
    poDate,
    deliveryDate,
    status,
    subtotal,
    discount,
    tax,
    grandTotal,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrdersTableData &&
          other.id == this.id &&
          other.poNumber == this.poNumber &&
          other.companyName == this.companyName &&
          other.vendorName == this.vendorName &&
          other.deliveryDestination == this.deliveryDestination &&
          other.poDate == this.poDate &&
          other.deliveryDate == this.deliveryDate &&
          other.status == this.status &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.tax == this.tax &&
          other.grandTotal == this.grandTotal &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PurchaseOrdersTableCompanion
    extends UpdateCompanion<PurchaseOrdersTableData> {
  final Value<String> id;
  final Value<String> poNumber;
  final Value<String> companyName;
  final Value<String> vendorName;
  final Value<String> deliveryDestination;
  final Value<DateTime> poDate;
  final Value<DateTime?> deliveryDate;
  final Value<String> status;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> tax;
  final Value<double> grandTotal;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PurchaseOrdersTableCompanion({
    this.id = const Value.absent(),
    this.poNumber = const Value.absent(),
    this.companyName = const Value.absent(),
    this.vendorName = const Value.absent(),
    this.deliveryDestination = const Value.absent(),
    this.poDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseOrdersTableCompanion.insert({
    required String id,
    required String poNumber,
    this.companyName = const Value.absent(),
    this.vendorName = const Value.absent(),
    this.deliveryDestination = const Value.absent(),
    required DateTime poDate,
    this.deliveryDate = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poNumber = Value(poNumber),
       poDate = Value(poDate);
  static Insertable<PurchaseOrdersTableData> custom({
    Expression<String>? id,
    Expression<String>? poNumber,
    Expression<String>? companyName,
    Expression<String>? vendorName,
    Expression<String>? deliveryDestination,
    Expression<DateTime>? poDate,
    Expression<DateTime>? deliveryDate,
    Expression<String>? status,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? tax,
    Expression<double>? grandTotal,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poNumber != null) 'po_number': poNumber,
      if (companyName != null) 'company_name': companyName,
      if (vendorName != null) 'vendor_name': vendorName,
      if (deliveryDestination != null)
        'delivery_destination': deliveryDestination,
      if (poDate != null) 'po_date': poDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (status != null) 'status': status,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (tax != null) 'tax': tax,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseOrdersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? poNumber,
    Value<String>? companyName,
    Value<String>? vendorName,
    Value<String>? deliveryDestination,
    Value<DateTime>? poDate,
    Value<DateTime?>? deliveryDate,
    Value<String>? status,
    Value<double>? subtotal,
    Value<double>? discount,
    Value<double>? tax,
    Value<double>? grandTotal,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PurchaseOrdersTableCompanion(
      id: id ?? this.id,
      poNumber: poNumber ?? this.poNumber,
      companyName: companyName ?? this.companyName,
      vendorName: vendorName ?? this.vendorName,
      deliveryDestination: deliveryDestination ?? this.deliveryDestination,
      poDate: poDate ?? this.poDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      grandTotal: grandTotal ?? this.grandTotal,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poNumber.present) {
      map['po_number'] = Variable<String>(poNumber.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (vendorName.present) {
      map['vendor_name'] = Variable<String>(vendorName.value);
    }
    if (deliveryDestination.present) {
      map['delivery_destination'] = Variable<String>(deliveryDestination.value);
    }
    if (poDate.present) {
      map['po_date'] = Variable<DateTime>(poDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('poNumber: $poNumber, ')
          ..write('companyName: $companyName, ')
          ..write('vendorName: $vendorName, ')
          ..write('deliveryDestination: $deliveryDestination, ')
          ..write('poDate: $poDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrderItemsTableTable extends PurchaseOrderItemsTable
    with TableInfo<$PurchaseOrderItemsTableTable, PurchaseOrderItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrderItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poIdMeta = const VerificationMeta('poId');
  @override
  late final GeneratedColumn<String> poId = GeneratedColumn<String>(
    'po_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_orders_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _itemIndexMeta = const VerificationMeta(
    'itemIndex',
  );
  @override
  late final GeneratedColumn<int> itemIndex = GeneratedColumn<int>(
    'item_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requestedQtyMeta = const VerificationMeta(
    'requestedQty',
  );
  @override
  late final GeneratedColumn<double> requestedQty = GeneratedColumn<double>(
    'requested_qty',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uomMeta = const VerificationMeta('uom');
  @override
  late final GeneratedColumn<String> uom = GeneratedColumn<String>(
    'uom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Pcs'),
  );
  static const VerificationMeta _targetUnitPriceMeta = const VerificationMeta(
    'targetUnitPrice',
  );
  @override
  late final GeneratedColumn<double> targetUnitPrice = GeneratedColumn<double>(
    'target_unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTotalPriceMeta = const VerificationMeta(
    'targetTotalPrice',
  );
  @override
  late final GeneratedColumn<double> targetTotalPrice = GeneratedColumn<double>(
    'target_total_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poId,
    itemIndex,
    description,
    requestedQty,
    uom,
    targetUnitPrice,
    targetTotalPrice,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_order_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseOrderItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('po_id')) {
      context.handle(
        _poIdMeta,
        poId.isAcceptableOrUnknown(data['po_id']!, _poIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poIdMeta);
    }
    if (data.containsKey('item_index')) {
      context.handle(
        _itemIndexMeta,
        itemIndex.isAcceptableOrUnknown(data['item_index']!, _itemIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIndexMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('requested_qty')) {
      context.handle(
        _requestedQtyMeta,
        requestedQty.isAcceptableOrUnknown(
          data['requested_qty']!,
          _requestedQtyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestedQtyMeta);
    }
    if (data.containsKey('uom')) {
      context.handle(
        _uomMeta,
        uom.isAcceptableOrUnknown(data['uom']!, _uomMeta),
      );
    }
    if (data.containsKey('target_unit_price')) {
      context.handle(
        _targetUnitPriceMeta,
        targetUnitPrice.isAcceptableOrUnknown(
          data['target_unit_price']!,
          _targetUnitPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetUnitPriceMeta);
    }
    if (data.containsKey('target_total_price')) {
      context.handle(
        _targetTotalPriceMeta,
        targetTotalPrice.isAcceptableOrUnknown(
          data['target_total_price']!,
          _targetTotalPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetTotalPriceMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrderItemsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrderItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}po_id'],
      )!,
      itemIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_index'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      requestedQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}requested_qty'],
      )!,
      uom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uom'],
      )!,
      targetUnitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_unit_price'],
      )!,
      targetTotalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_total_price'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
    );
  }

  @override
  $PurchaseOrderItemsTableTable createAlias(String alias) {
    return $PurchaseOrderItemsTableTable(attachedDatabase, alias);
  }
}

class PurchaseOrderItemsTableData extends DataClass
    implements Insertable<PurchaseOrderItemsTableData> {
  final String id;
  final String poId;
  final int itemIndex;
  final String description;
  final double requestedQty;
  final String uom;
  final double targetUnitPrice;
  final double targetTotalPrice;
  final String? category;
  const PurchaseOrderItemsTableData({
    required this.id,
    required this.poId,
    required this.itemIndex,
    required this.description,
    required this.requestedQty,
    required this.uom,
    required this.targetUnitPrice,
    required this.targetTotalPrice,
    this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['po_id'] = Variable<String>(poId);
    map['item_index'] = Variable<int>(itemIndex);
    map['description'] = Variable<String>(description);
    map['requested_qty'] = Variable<double>(requestedQty);
    map['uom'] = Variable<String>(uom);
    map['target_unit_price'] = Variable<double>(targetUnitPrice);
    map['target_total_price'] = Variable<double>(targetTotalPrice);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    return map;
  }

  PurchaseOrderItemsTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrderItemsTableCompanion(
      id: Value(id),
      poId: Value(poId),
      itemIndex: Value(itemIndex),
      description: Value(description),
      requestedQty: Value(requestedQty),
      uom: Value(uom),
      targetUnitPrice: Value(targetUnitPrice),
      targetTotalPrice: Value(targetTotalPrice),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory PurchaseOrderItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrderItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      poId: serializer.fromJson<String>(json['poId']),
      itemIndex: serializer.fromJson<int>(json['itemIndex']),
      description: serializer.fromJson<String>(json['description']),
      requestedQty: serializer.fromJson<double>(json['requestedQty']),
      uom: serializer.fromJson<String>(json['uom']),
      targetUnitPrice: serializer.fromJson<double>(json['targetUnitPrice']),
      targetTotalPrice: serializer.fromJson<double>(json['targetTotalPrice']),
      category: serializer.fromJson<String?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poId': serializer.toJson<String>(poId),
      'itemIndex': serializer.toJson<int>(itemIndex),
      'description': serializer.toJson<String>(description),
      'requestedQty': serializer.toJson<double>(requestedQty),
      'uom': serializer.toJson<String>(uom),
      'targetUnitPrice': serializer.toJson<double>(targetUnitPrice),
      'targetTotalPrice': serializer.toJson<double>(targetTotalPrice),
      'category': serializer.toJson<String?>(category),
    };
  }

  PurchaseOrderItemsTableData copyWith({
    String? id,
    String? poId,
    int? itemIndex,
    String? description,
    double? requestedQty,
    String? uom,
    double? targetUnitPrice,
    double? targetTotalPrice,
    Value<String?> category = const Value.absent(),
  }) => PurchaseOrderItemsTableData(
    id: id ?? this.id,
    poId: poId ?? this.poId,
    itemIndex: itemIndex ?? this.itemIndex,
    description: description ?? this.description,
    requestedQty: requestedQty ?? this.requestedQty,
    uom: uom ?? this.uom,
    targetUnitPrice: targetUnitPrice ?? this.targetUnitPrice,
    targetTotalPrice: targetTotalPrice ?? this.targetTotalPrice,
    category: category.present ? category.value : this.category,
  );
  PurchaseOrderItemsTableData copyWithCompanion(
    PurchaseOrderItemsTableCompanion data,
  ) {
    return PurchaseOrderItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      poId: data.poId.present ? data.poId.value : this.poId,
      itemIndex: data.itemIndex.present ? data.itemIndex.value : this.itemIndex,
      description: data.description.present
          ? data.description.value
          : this.description,
      requestedQty: data.requestedQty.present
          ? data.requestedQty.value
          : this.requestedQty,
      uom: data.uom.present ? data.uom.value : this.uom,
      targetUnitPrice: data.targetUnitPrice.present
          ? data.targetUnitPrice.value
          : this.targetUnitPrice,
      targetTotalPrice: data.targetTotalPrice.present
          ? data.targetTotalPrice.value
          : this.targetTotalPrice,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItemsTableData(')
          ..write('id: $id, ')
          ..write('poId: $poId, ')
          ..write('itemIndex: $itemIndex, ')
          ..write('description: $description, ')
          ..write('requestedQty: $requestedQty, ')
          ..write('uom: $uom, ')
          ..write('targetUnitPrice: $targetUnitPrice, ')
          ..write('targetTotalPrice: $targetTotalPrice, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    poId,
    itemIndex,
    description,
    requestedQty,
    uom,
    targetUnitPrice,
    targetTotalPrice,
    category,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrderItemsTableData &&
          other.id == this.id &&
          other.poId == this.poId &&
          other.itemIndex == this.itemIndex &&
          other.description == this.description &&
          other.requestedQty == this.requestedQty &&
          other.uom == this.uom &&
          other.targetUnitPrice == this.targetUnitPrice &&
          other.targetTotalPrice == this.targetTotalPrice &&
          other.category == this.category);
}

class PurchaseOrderItemsTableCompanion
    extends UpdateCompanion<PurchaseOrderItemsTableData> {
  final Value<String> id;
  final Value<String> poId;
  final Value<int> itemIndex;
  final Value<String> description;
  final Value<double> requestedQty;
  final Value<String> uom;
  final Value<double> targetUnitPrice;
  final Value<double> targetTotalPrice;
  final Value<String?> category;
  final Value<int> rowid;
  const PurchaseOrderItemsTableCompanion({
    this.id = const Value.absent(),
    this.poId = const Value.absent(),
    this.itemIndex = const Value.absent(),
    this.description = const Value.absent(),
    this.requestedQty = const Value.absent(),
    this.uom = const Value.absent(),
    this.targetUnitPrice = const Value.absent(),
    this.targetTotalPrice = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseOrderItemsTableCompanion.insert({
    required String id,
    required String poId,
    required int itemIndex,
    required String description,
    required double requestedQty,
    this.uom = const Value.absent(),
    required double targetUnitPrice,
    required double targetTotalPrice,
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poId = Value(poId),
       itemIndex = Value(itemIndex),
       description = Value(description),
       requestedQty = Value(requestedQty),
       targetUnitPrice = Value(targetUnitPrice),
       targetTotalPrice = Value(targetTotalPrice);
  static Insertable<PurchaseOrderItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? poId,
    Expression<int>? itemIndex,
    Expression<String>? description,
    Expression<double>? requestedQty,
    Expression<String>? uom,
    Expression<double>? targetUnitPrice,
    Expression<double>? targetTotalPrice,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poId != null) 'po_id': poId,
      if (itemIndex != null) 'item_index': itemIndex,
      if (description != null) 'description': description,
      if (requestedQty != null) 'requested_qty': requestedQty,
      if (uom != null) 'uom': uom,
      if (targetUnitPrice != null) 'target_unit_price': targetUnitPrice,
      if (targetTotalPrice != null) 'target_total_price': targetTotalPrice,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseOrderItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? poId,
    Value<int>? itemIndex,
    Value<String>? description,
    Value<double>? requestedQty,
    Value<String>? uom,
    Value<double>? targetUnitPrice,
    Value<double>? targetTotalPrice,
    Value<String?>? category,
    Value<int>? rowid,
  }) {
    return PurchaseOrderItemsTableCompanion(
      id: id ?? this.id,
      poId: poId ?? this.poId,
      itemIndex: itemIndex ?? this.itemIndex,
      description: description ?? this.description,
      requestedQty: requestedQty ?? this.requestedQty,
      uom: uom ?? this.uom,
      targetUnitPrice: targetUnitPrice ?? this.targetUnitPrice,
      targetTotalPrice: targetTotalPrice ?? this.targetTotalPrice,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poId.present) {
      map['po_id'] = Variable<String>(poId.value);
    }
    if (itemIndex.present) {
      map['item_index'] = Variable<int>(itemIndex.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (requestedQty.present) {
      map['requested_qty'] = Variable<double>(requestedQty.value);
    }
    if (uom.present) {
      map['uom'] = Variable<String>(uom.value);
    }
    if (targetUnitPrice.present) {
      map['target_unit_price'] = Variable<double>(targetUnitPrice.value);
    }
    if (targetTotalPrice.present) {
      map['target_total_price'] = Variable<double>(targetTotalPrice.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('poId: $poId, ')
          ..write('itemIndex: $itemIndex, ')
          ..write('description: $description, ')
          ..write('requestedQty: $requestedQty, ')
          ..write('uom: $uom, ')
          ..write('targetUnitPrice: $targetUnitPrice, ')
          ..write('targetTotalPrice: $targetTotalPrice, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FulfillmentBatchesTableTable extends FulfillmentBatchesTable
    with TableInfo<$FulfillmentBatchesTableTable, FulfillmentBatchesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FulfillmentBatchesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poIdMeta = const VerificationMeta('poId');
  @override
  late final GeneratedColumn<String> poId = GeneratedColumn<String>(
    'po_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_orders_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _batchNumberMeta = const VerificationMeta(
    'batchNumber',
  );
  @override
  late final GeneratedColumn<String> batchNumber = GeneratedColumn<String>(
    'batch_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryNoteNumberMeta =
      const VerificationMeta('deliveryNoteNumber');
  @override
  late final GeneratedColumn<String> deliveryNoteNumber =
      GeneratedColumn<String>(
        'delivery_note_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _fulfillmentDateMeta = const VerificationMeta(
    'fulfillmentDate',
  );
  @override
  late final GeneratedColumn<DateTime> fulfillmentDate =
      GeneratedColumn<DateTime>(
        'fulfillment_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('in_progress'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poId,
    batchNumber,
    deliveryNoteNumber,
    fulfillmentDate,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fulfillment_batches_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FulfillmentBatchesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('po_id')) {
      context.handle(
        _poIdMeta,
        poId.isAcceptableOrUnknown(data['po_id']!, _poIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poIdMeta);
    }
    if (data.containsKey('batch_number')) {
      context.handle(
        _batchNumberMeta,
        batchNumber.isAcceptableOrUnknown(
          data['batch_number']!,
          _batchNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_batchNumberMeta);
    }
    if (data.containsKey('delivery_note_number')) {
      context.handle(
        _deliveryNoteNumberMeta,
        deliveryNoteNumber.isAcceptableOrUnknown(
          data['delivery_note_number']!,
          _deliveryNoteNumberMeta,
        ),
      );
    }
    if (data.containsKey('fulfillment_date')) {
      context.handle(
        _fulfillmentDateMeta,
        fulfillmentDate.isAcceptableOrUnknown(
          data['fulfillment_date']!,
          _fulfillmentDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FulfillmentBatchesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FulfillmentBatchesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}po_id'],
      )!,
      batchNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_number'],
      )!,
      deliveryNoteNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_note_number'],
      ),
      fulfillmentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fulfillment_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FulfillmentBatchesTableTable createAlias(String alias) {
    return $FulfillmentBatchesTableTable(attachedDatabase, alias);
  }
}

class FulfillmentBatchesTableData extends DataClass
    implements Insertable<FulfillmentBatchesTableData> {
  final String id;
  final String poId;
  final String batchNumber;
  final String? deliveryNoteNumber;
  final DateTime fulfillmentDate;
  final String status;
  final String? notes;
  final DateTime createdAt;
  const FulfillmentBatchesTableData({
    required this.id,
    required this.poId,
    required this.batchNumber,
    this.deliveryNoteNumber,
    required this.fulfillmentDate,
    required this.status,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['po_id'] = Variable<String>(poId);
    map['batch_number'] = Variable<String>(batchNumber);
    if (!nullToAbsent || deliveryNoteNumber != null) {
      map['delivery_note_number'] = Variable<String>(deliveryNoteNumber);
    }
    map['fulfillment_date'] = Variable<DateTime>(fulfillmentDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FulfillmentBatchesTableCompanion toCompanion(bool nullToAbsent) {
    return FulfillmentBatchesTableCompanion(
      id: Value(id),
      poId: Value(poId),
      batchNumber: Value(batchNumber),
      deliveryNoteNumber: deliveryNoteNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryNoteNumber),
      fulfillmentDate: Value(fulfillmentDate),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory FulfillmentBatchesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FulfillmentBatchesTableData(
      id: serializer.fromJson<String>(json['id']),
      poId: serializer.fromJson<String>(json['poId']),
      batchNumber: serializer.fromJson<String>(json['batchNumber']),
      deliveryNoteNumber: serializer.fromJson<String?>(
        json['deliveryNoteNumber'],
      ),
      fulfillmentDate: serializer.fromJson<DateTime>(json['fulfillmentDate']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poId': serializer.toJson<String>(poId),
      'batchNumber': serializer.toJson<String>(batchNumber),
      'deliveryNoteNumber': serializer.toJson<String?>(deliveryNoteNumber),
      'fulfillmentDate': serializer.toJson<DateTime>(fulfillmentDate),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FulfillmentBatchesTableData copyWith({
    String? id,
    String? poId,
    String? batchNumber,
    Value<String?> deliveryNoteNumber = const Value.absent(),
    DateTime? fulfillmentDate,
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => FulfillmentBatchesTableData(
    id: id ?? this.id,
    poId: poId ?? this.poId,
    batchNumber: batchNumber ?? this.batchNumber,
    deliveryNoteNumber: deliveryNoteNumber.present
        ? deliveryNoteNumber.value
        : this.deliveryNoteNumber,
    fulfillmentDate: fulfillmentDate ?? this.fulfillmentDate,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  FulfillmentBatchesTableData copyWithCompanion(
    FulfillmentBatchesTableCompanion data,
  ) {
    return FulfillmentBatchesTableData(
      id: data.id.present ? data.id.value : this.id,
      poId: data.poId.present ? data.poId.value : this.poId,
      batchNumber: data.batchNumber.present
          ? data.batchNumber.value
          : this.batchNumber,
      deliveryNoteNumber: data.deliveryNoteNumber.present
          ? data.deliveryNoteNumber.value
          : this.deliveryNoteNumber,
      fulfillmentDate: data.fulfillmentDate.present
          ? data.fulfillmentDate.value
          : this.fulfillmentDate,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FulfillmentBatchesTableData(')
          ..write('id: $id, ')
          ..write('poId: $poId, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('deliveryNoteNumber: $deliveryNoteNumber, ')
          ..write('fulfillmentDate: $fulfillmentDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    poId,
    batchNumber,
    deliveryNoteNumber,
    fulfillmentDate,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FulfillmentBatchesTableData &&
          other.id == this.id &&
          other.poId == this.poId &&
          other.batchNumber == this.batchNumber &&
          other.deliveryNoteNumber == this.deliveryNoteNumber &&
          other.fulfillmentDate == this.fulfillmentDate &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class FulfillmentBatchesTableCompanion
    extends UpdateCompanion<FulfillmentBatchesTableData> {
  final Value<String> id;
  final Value<String> poId;
  final Value<String> batchNumber;
  final Value<String?> deliveryNoteNumber;
  final Value<DateTime> fulfillmentDate;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FulfillmentBatchesTableCompanion({
    this.id = const Value.absent(),
    this.poId = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.deliveryNoteNumber = const Value.absent(),
    this.fulfillmentDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FulfillmentBatchesTableCompanion.insert({
    required String id,
    required String poId,
    required String batchNumber,
    this.deliveryNoteNumber = const Value.absent(),
    this.fulfillmentDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poId = Value(poId),
       batchNumber = Value(batchNumber);
  static Insertable<FulfillmentBatchesTableData> custom({
    Expression<String>? id,
    Expression<String>? poId,
    Expression<String>? batchNumber,
    Expression<String>? deliveryNoteNumber,
    Expression<DateTime>? fulfillmentDate,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poId != null) 'po_id': poId,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (deliveryNoteNumber != null)
        'delivery_note_number': deliveryNoteNumber,
      if (fulfillmentDate != null) 'fulfillment_date': fulfillmentDate,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FulfillmentBatchesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? poId,
    Value<String>? batchNumber,
    Value<String?>? deliveryNoteNumber,
    Value<DateTime>? fulfillmentDate,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FulfillmentBatchesTableCompanion(
      id: id ?? this.id,
      poId: poId ?? this.poId,
      batchNumber: batchNumber ?? this.batchNumber,
      deliveryNoteNumber: deliveryNoteNumber ?? this.deliveryNoteNumber,
      fulfillmentDate: fulfillmentDate ?? this.fulfillmentDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poId.present) {
      map['po_id'] = Variable<String>(poId.value);
    }
    if (batchNumber.present) {
      map['batch_number'] = Variable<String>(batchNumber.value);
    }
    if (deliveryNoteNumber.present) {
      map['delivery_note_number'] = Variable<String>(deliveryNoteNumber.value);
    }
    if (fulfillmentDate.present) {
      map['fulfillment_date'] = Variable<DateTime>(fulfillmentDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FulfillmentBatchesTableCompanion(')
          ..write('id: $id, ')
          ..write('poId: $poId, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('deliveryNoteNumber: $deliveryNoteNumber, ')
          ..write('fulfillmentDate: $fulfillmentDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FulfillmentItemsTableTable extends FulfillmentItemsTable
    with TableInfo<$FulfillmentItemsTableTable, FulfillmentItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FulfillmentItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES fulfillment_batches_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _poItemIdMeta = const VerificationMeta(
    'poItemId',
  );
  @override
  late final GeneratedColumn<String> poItemId = GeneratedColumn<String>(
    'po_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_order_items_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _fulfilledQtyMeta = const VerificationMeta(
    'fulfilledQty',
  );
  @override
  late final GeneratedColumn<double> fulfilledQty = GeneratedColumn<double>(
    'fulfilled_qty',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _billedUnitPriceMeta = const VerificationMeta(
    'billedUnitPrice',
  );
  @override
  late final GeneratedColumn<double> billedUnitPrice = GeneratedColumn<double>(
    'billed_unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _purchaseCostPriceMeta = const VerificationMeta(
    'purchaseCostPrice',
  );
  @override
  late final GeneratedColumn<double> purchaseCostPrice =
      GeneratedColumn<double>(
        'purchase_cost_price',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _finalTotalPriceMeta = const VerificationMeta(
    'finalTotalPrice',
  );
  @override
  late final GeneratedColumn<double> finalTotalPrice = GeneratedColumn<double>(
    'final_total_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchId,
    poItemId,
    fulfilledQty,
    billedUnitPrice,
    purchaseCostPrice,
    finalTotalPrice,
    status,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fulfillment_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FulfillmentItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('po_item_id')) {
      context.handle(
        _poItemIdMeta,
        poItemId.isAcceptableOrUnknown(data['po_item_id']!, _poItemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poItemIdMeta);
    }
    if (data.containsKey('fulfilled_qty')) {
      context.handle(
        _fulfilledQtyMeta,
        fulfilledQty.isAcceptableOrUnknown(
          data['fulfilled_qty']!,
          _fulfilledQtyMeta,
        ),
      );
    }
    if (data.containsKey('billed_unit_price')) {
      context.handle(
        _billedUnitPriceMeta,
        billedUnitPrice.isAcceptableOrUnknown(
          data['billed_unit_price']!,
          _billedUnitPriceMeta,
        ),
      );
    }
    if (data.containsKey('purchase_cost_price')) {
      context.handle(
        _purchaseCostPriceMeta,
        purchaseCostPrice.isAcceptableOrUnknown(
          data['purchase_cost_price']!,
          _purchaseCostPriceMeta,
        ),
      );
    }
    if (data.containsKey('final_total_price')) {
      context.handle(
        _finalTotalPriceMeta,
        finalTotalPrice.isAcceptableOrUnknown(
          data['final_total_price']!,
          _finalTotalPriceMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FulfillmentItemsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FulfillmentItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      poItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}po_item_id'],
      )!,
      fulfilledQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fulfilled_qty'],
      )!,
      billedUnitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}billed_unit_price'],
      )!,
      purchaseCostPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_cost_price'],
      ),
      finalTotalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_total_price'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $FulfillmentItemsTableTable createAlias(String alias) {
    return $FulfillmentItemsTableTable(attachedDatabase, alias);
  }
}

class FulfillmentItemsTableData extends DataClass
    implements Insertable<FulfillmentItemsTableData> {
  final String id;
  final String batchId;
  final String poItemId;
  final double fulfilledQty;
  final double billedUnitPrice;
  final double? purchaseCostPrice;
  final double finalTotalPrice;
  final String status;
  final String? note;
  const FulfillmentItemsTableData({
    required this.id,
    required this.batchId,
    required this.poItemId,
    required this.fulfilledQty,
    required this.billedUnitPrice,
    this.purchaseCostPrice,
    required this.finalTotalPrice,
    required this.status,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['po_item_id'] = Variable<String>(poItemId);
    map['fulfilled_qty'] = Variable<double>(fulfilledQty);
    map['billed_unit_price'] = Variable<double>(billedUnitPrice);
    if (!nullToAbsent || purchaseCostPrice != null) {
      map['purchase_cost_price'] = Variable<double>(purchaseCostPrice);
    }
    map['final_total_price'] = Variable<double>(finalTotalPrice);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  FulfillmentItemsTableCompanion toCompanion(bool nullToAbsent) {
    return FulfillmentItemsTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      poItemId: Value(poItemId),
      fulfilledQty: Value(fulfilledQty),
      billedUnitPrice: Value(billedUnitPrice),
      purchaseCostPrice: purchaseCostPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseCostPrice),
      finalTotalPrice: Value(finalTotalPrice),
      status: Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory FulfillmentItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FulfillmentItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      poItemId: serializer.fromJson<String>(json['poItemId']),
      fulfilledQty: serializer.fromJson<double>(json['fulfilledQty']),
      billedUnitPrice: serializer.fromJson<double>(json['billedUnitPrice']),
      purchaseCostPrice: serializer.fromJson<double?>(
        json['purchaseCostPrice'],
      ),
      finalTotalPrice: serializer.fromJson<double>(json['finalTotalPrice']),
      status: serializer.fromJson<String>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'poItemId': serializer.toJson<String>(poItemId),
      'fulfilledQty': serializer.toJson<double>(fulfilledQty),
      'billedUnitPrice': serializer.toJson<double>(billedUnitPrice),
      'purchaseCostPrice': serializer.toJson<double?>(purchaseCostPrice),
      'finalTotalPrice': serializer.toJson<double>(finalTotalPrice),
      'status': serializer.toJson<String>(status),
      'note': serializer.toJson<String?>(note),
    };
  }

  FulfillmentItemsTableData copyWith({
    String? id,
    String? batchId,
    String? poItemId,
    double? fulfilledQty,
    double? billedUnitPrice,
    Value<double?> purchaseCostPrice = const Value.absent(),
    double? finalTotalPrice,
    String? status,
    Value<String?> note = const Value.absent(),
  }) => FulfillmentItemsTableData(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    poItemId: poItemId ?? this.poItemId,
    fulfilledQty: fulfilledQty ?? this.fulfilledQty,
    billedUnitPrice: billedUnitPrice ?? this.billedUnitPrice,
    purchaseCostPrice: purchaseCostPrice.present
        ? purchaseCostPrice.value
        : this.purchaseCostPrice,
    finalTotalPrice: finalTotalPrice ?? this.finalTotalPrice,
    status: status ?? this.status,
    note: note.present ? note.value : this.note,
  );
  FulfillmentItemsTableData copyWithCompanion(
    FulfillmentItemsTableCompanion data,
  ) {
    return FulfillmentItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      poItemId: data.poItemId.present ? data.poItemId.value : this.poItemId,
      fulfilledQty: data.fulfilledQty.present
          ? data.fulfilledQty.value
          : this.fulfilledQty,
      billedUnitPrice: data.billedUnitPrice.present
          ? data.billedUnitPrice.value
          : this.billedUnitPrice,
      purchaseCostPrice: data.purchaseCostPrice.present
          ? data.purchaseCostPrice.value
          : this.purchaseCostPrice,
      finalTotalPrice: data.finalTotalPrice.present
          ? data.finalTotalPrice.value
          : this.finalTotalPrice,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FulfillmentItemsTableData(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('poItemId: $poItemId, ')
          ..write('fulfilledQty: $fulfilledQty, ')
          ..write('billedUnitPrice: $billedUnitPrice, ')
          ..write('purchaseCostPrice: $purchaseCostPrice, ')
          ..write('finalTotalPrice: $finalTotalPrice, ')
          ..write('status: $status, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    batchId,
    poItemId,
    fulfilledQty,
    billedUnitPrice,
    purchaseCostPrice,
    finalTotalPrice,
    status,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FulfillmentItemsTableData &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.poItemId == this.poItemId &&
          other.fulfilledQty == this.fulfilledQty &&
          other.billedUnitPrice == this.billedUnitPrice &&
          other.purchaseCostPrice == this.purchaseCostPrice &&
          other.finalTotalPrice == this.finalTotalPrice &&
          other.status == this.status &&
          other.note == this.note);
}

class FulfillmentItemsTableCompanion
    extends UpdateCompanion<FulfillmentItemsTableData> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<String> poItemId;
  final Value<double> fulfilledQty;
  final Value<double> billedUnitPrice;
  final Value<double?> purchaseCostPrice;
  final Value<double> finalTotalPrice;
  final Value<String> status;
  final Value<String?> note;
  final Value<int> rowid;
  const FulfillmentItemsTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.poItemId = const Value.absent(),
    this.fulfilledQty = const Value.absent(),
    this.billedUnitPrice = const Value.absent(),
    this.purchaseCostPrice = const Value.absent(),
    this.finalTotalPrice = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FulfillmentItemsTableCompanion.insert({
    required String id,
    required String batchId,
    required String poItemId,
    this.fulfilledQty = const Value.absent(),
    this.billedUnitPrice = const Value.absent(),
    this.purchaseCostPrice = const Value.absent(),
    this.finalTotalPrice = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       batchId = Value(batchId),
       poItemId = Value(poItemId);
  static Insertable<FulfillmentItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<String>? poItemId,
    Expression<double>? fulfilledQty,
    Expression<double>? billedUnitPrice,
    Expression<double>? purchaseCostPrice,
    Expression<double>? finalTotalPrice,
    Expression<String>? status,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (poItemId != null) 'po_item_id': poItemId,
      if (fulfilledQty != null) 'fulfilled_qty': fulfilledQty,
      if (billedUnitPrice != null) 'billed_unit_price': billedUnitPrice,
      if (purchaseCostPrice != null) 'purchase_cost_price': purchaseCostPrice,
      if (finalTotalPrice != null) 'final_total_price': finalTotalPrice,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FulfillmentItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? batchId,
    Value<String>? poItemId,
    Value<double>? fulfilledQty,
    Value<double>? billedUnitPrice,
    Value<double?>? purchaseCostPrice,
    Value<double>? finalTotalPrice,
    Value<String>? status,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return FulfillmentItemsTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      poItemId: poItemId ?? this.poItemId,
      fulfilledQty: fulfilledQty ?? this.fulfilledQty,
      billedUnitPrice: billedUnitPrice ?? this.billedUnitPrice,
      purchaseCostPrice: purchaseCostPrice ?? this.purchaseCostPrice,
      finalTotalPrice: finalTotalPrice ?? this.finalTotalPrice,
      status: status ?? this.status,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (poItemId.present) {
      map['po_item_id'] = Variable<String>(poItemId.value);
    }
    if (fulfilledQty.present) {
      map['fulfilled_qty'] = Variable<double>(fulfilledQty.value);
    }
    if (billedUnitPrice.present) {
      map['billed_unit_price'] = Variable<double>(billedUnitPrice.value);
    }
    if (purchaseCostPrice.present) {
      map['purchase_cost_price'] = Variable<double>(purchaseCostPrice.value);
    }
    if (finalTotalPrice.present) {
      map['final_total_price'] = Variable<double>(finalTotalPrice.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FulfillmentItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('poItemId: $poItemId, ')
          ..write('fulfilledQty: $fulfilledQty, ')
          ..write('billedUnitPrice: $billedUnitPrice, ')
          ..write('purchaseCostPrice: $purchaseCostPrice, ')
          ..write('finalTotalPrice: $finalTotalPrice, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTableTable extends InvoicesTable
    with TableInfo<$InvoicesTableTable, InvoicesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES fulfillment_batches_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _poIdMeta = const VerificationMeta('poId');
  @override
  late final GeneratedColumn<String> poId = GeneratedColumn<String>(
    'po_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_orders_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceDateMeta = const VerificationMeta(
    'invoiceDate',
  );
  @override
  late final GeneratedColumn<DateTime> invoiceDate = GeneratedColumn<DateTime>(
    'invoice_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double> tax = GeneratedColumn<double>(
    'tax',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _bankAccountNameMeta = const VerificationMeta(
    'bankAccountName',
  );
  @override
  late final GeneratedColumn<String> bankAccountName = GeneratedColumn<String>(
    'bank_account_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankAccountNumberMeta = const VerificationMeta(
    'bankAccountNumber',
  );
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>(
        'bank_account_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentTermsMeta = const VerificationMeta(
    'paymentTerms',
  );
  @override
  late final GeneratedColumn<String> paymentTerms = GeneratedColumn<String>(
    'payment_terms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchId,
    poId,
    invoiceNumber,
    invoiceDate,
    dueDate,
    subtotal,
    discount,
    tax,
    grandTotal,
    bankAccountName,
    bankAccountNumber,
    bankName,
    paymentTerms,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoicesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('po_id')) {
      context.handle(
        _poIdMeta,
        poId.isAcceptableOrUnknown(data['po_id']!, _poIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poIdMeta);
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('invoice_date')) {
      context.handle(
        _invoiceDateMeta,
        invoiceDate.isAcceptableOrUnknown(
          data['invoice_date']!,
          _invoiceDateMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('tax')) {
      context.handle(
        _taxMeta,
        tax.isAcceptableOrUnknown(data['tax']!, _taxMeta),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    }
    if (data.containsKey('bank_account_name')) {
      context.handle(
        _bankAccountNameMeta,
        bankAccountName.isAcceptableOrUnknown(
          data['bank_account_name']!,
          _bankAccountNameMeta,
        ),
      );
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
        _bankAccountNumberMeta,
        bankAccountNumber.isAcceptableOrUnknown(
          data['bank_account_number']!,
          _bankAccountNumberMeta,
        ),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('payment_terms')) {
      context.handle(
        _paymentTermsMeta,
        paymentTerms.isAcceptableOrUnknown(
          data['payment_terms']!,
          _paymentTermsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoicesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoicesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      poId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}po_id'],
      )!,
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_number'],
      )!,
      invoiceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}invoice_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      tax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grand_total'],
      )!,
      bankAccountName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_account_name'],
      ),
      bankAccountNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_account_number'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      paymentTerms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_terms'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $InvoicesTableTable createAlias(String alias) {
    return $InvoicesTableTable(attachedDatabase, alias);
  }
}

class InvoicesTableData extends DataClass
    implements Insertable<InvoicesTableData> {
  final String id;
  final String batchId;
  final String poId;
  final String invoiceNumber;
  final DateTime invoiceDate;
  final DateTime? dueDate;
  final double subtotal;
  final double discount;
  final double tax;
  final double grandTotal;
  final String? bankAccountName;
  final String? bankAccountNumber;
  final String? bankName;
  final String? paymentTerms;
  final String? notes;
  final DateTime createdAt;
  const InvoicesTableData({
    required this.id,
    required this.batchId,
    required this.poId,
    required this.invoiceNumber,
    required this.invoiceDate,
    this.dueDate,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.grandTotal,
    this.bankAccountName,
    this.bankAccountNumber,
    this.bankName,
    this.paymentTerms,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['po_id'] = Variable<String>(poId);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['invoice_date'] = Variable<DateTime>(invoiceDate);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['tax'] = Variable<double>(tax);
    map['grand_total'] = Variable<double>(grandTotal);
    if (!nullToAbsent || bankAccountName != null) {
      map['bank_account_name'] = Variable<String>(bankAccountName);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || paymentTerms != null) {
      map['payment_terms'] = Variable<String>(paymentTerms);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InvoicesTableCompanion toCompanion(bool nullToAbsent) {
    return InvoicesTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      poId: Value(poId),
      invoiceNumber: Value(invoiceNumber),
      invoiceDate: Value(invoiceDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      subtotal: Value(subtotal),
      discount: Value(discount),
      tax: Value(tax),
      grandTotal: Value(grandTotal),
      bankAccountName: bankAccountName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountName),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      paymentTerms: paymentTerms == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentTerms),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory InvoicesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoicesTableData(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      poId: serializer.fromJson<String>(json['poId']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      invoiceDate: serializer.fromJson<DateTime>(json['invoiceDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      tax: serializer.fromJson<double>(json['tax']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      bankAccountName: serializer.fromJson<String?>(json['bankAccountName']),
      bankAccountNumber: serializer.fromJson<String?>(
        json['bankAccountNumber'],
      ),
      bankName: serializer.fromJson<String?>(json['bankName']),
      paymentTerms: serializer.fromJson<String?>(json['paymentTerms']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'poId': serializer.toJson<String>(poId),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'invoiceDate': serializer.toJson<DateTime>(invoiceDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'tax': serializer.toJson<double>(tax),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'bankAccountName': serializer.toJson<String?>(bankAccountName),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
      'bankName': serializer.toJson<String?>(bankName),
      'paymentTerms': serializer.toJson<String?>(paymentTerms),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  InvoicesTableData copyWith({
    String? id,
    String? batchId,
    String? poId,
    String? invoiceNumber,
    DateTime? invoiceDate,
    Value<DateTime?> dueDate = const Value.absent(),
    double? subtotal,
    double? discount,
    double? tax,
    double? grandTotal,
    Value<String?> bankAccountName = const Value.absent(),
    Value<String?> bankAccountNumber = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> paymentTerms = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => InvoicesTableData(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    poId: poId ?? this.poId,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    invoiceDate: invoiceDate ?? this.invoiceDate,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    tax: tax ?? this.tax,
    grandTotal: grandTotal ?? this.grandTotal,
    bankAccountName: bankAccountName.present
        ? bankAccountName.value
        : this.bankAccountName,
    bankAccountNumber: bankAccountNumber.present
        ? bankAccountNumber.value
        : this.bankAccountNumber,
    bankName: bankName.present ? bankName.value : this.bankName,
    paymentTerms: paymentTerms.present ? paymentTerms.value : this.paymentTerms,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  InvoicesTableData copyWithCompanion(InvoicesTableCompanion data) {
    return InvoicesTableData(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      poId: data.poId.present ? data.poId.value : this.poId,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      invoiceDate: data.invoiceDate.present
          ? data.invoiceDate.value
          : this.invoiceDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      tax: data.tax.present ? data.tax.value : this.tax,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      bankAccountName: data.bankAccountName.present
          ? data.bankAccountName.value
          : this.bankAccountName,
      bankAccountNumber: data.bankAccountNumber.present
          ? data.bankAccountNumber.value
          : this.bankAccountNumber,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      paymentTerms: data.paymentTerms.present
          ? data.paymentTerms.value
          : this.paymentTerms,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesTableData(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('poId: $poId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('bankAccountName: $bankAccountName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankName: $bankName, ')
          ..write('paymentTerms: $paymentTerms, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    batchId,
    poId,
    invoiceNumber,
    invoiceDate,
    dueDate,
    subtotal,
    discount,
    tax,
    grandTotal,
    bankAccountName,
    bankAccountNumber,
    bankName,
    paymentTerms,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoicesTableData &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.poId == this.poId &&
          other.invoiceNumber == this.invoiceNumber &&
          other.invoiceDate == this.invoiceDate &&
          other.dueDate == this.dueDate &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.tax == this.tax &&
          other.grandTotal == this.grandTotal &&
          other.bankAccountName == this.bankAccountName &&
          other.bankAccountNumber == this.bankAccountNumber &&
          other.bankName == this.bankName &&
          other.paymentTerms == this.paymentTerms &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class InvoicesTableCompanion extends UpdateCompanion<InvoicesTableData> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<String> poId;
  final Value<String> invoiceNumber;
  final Value<DateTime> invoiceDate;
  final Value<DateTime?> dueDate;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> tax;
  final Value<double> grandTotal;
  final Value<String?> bankAccountName;
  final Value<String?> bankAccountNumber;
  final Value<String?> bankName;
  final Value<String?> paymentTerms;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const InvoicesTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.poId = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.invoiceDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.bankAccountName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankName = const Value.absent(),
    this.paymentTerms = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesTableCompanion.insert({
    required String id,
    required String batchId,
    required String poId,
    required String invoiceNumber,
    this.invoiceDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.bankAccountName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankName = const Value.absent(),
    this.paymentTerms = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       batchId = Value(batchId),
       poId = Value(poId),
       invoiceNumber = Value(invoiceNumber);
  static Insertable<InvoicesTableData> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<String>? poId,
    Expression<String>? invoiceNumber,
    Expression<DateTime>? invoiceDate,
    Expression<DateTime>? dueDate,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? tax,
    Expression<double>? grandTotal,
    Expression<String>? bankAccountName,
    Expression<String>? bankAccountNumber,
    Expression<String>? bankName,
    Expression<String>? paymentTerms,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (poId != null) 'po_id': poId,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (invoiceDate != null) 'invoice_date': invoiceDate,
      if (dueDate != null) 'due_date': dueDate,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (tax != null) 'tax': tax,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (bankAccountName != null) 'bank_account_name': bankAccountName,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
      if (bankName != null) 'bank_name': bankName,
      if (paymentTerms != null) 'payment_terms': paymentTerms,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? batchId,
    Value<String>? poId,
    Value<String>? invoiceNumber,
    Value<DateTime>? invoiceDate,
    Value<DateTime?>? dueDate,
    Value<double>? subtotal,
    Value<double>? discount,
    Value<double>? tax,
    Value<double>? grandTotal,
    Value<String?>? bankAccountName,
    Value<String?>? bankAccountNumber,
    Value<String?>? bankName,
    Value<String?>? paymentTerms,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return InvoicesTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      poId: poId ?? this.poId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      dueDate: dueDate ?? this.dueDate,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      grandTotal: grandTotal ?? this.grandTotal,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankName: bankName ?? this.bankName,
      paymentTerms: paymentTerms ?? this.paymentTerms,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (poId.present) {
      map['po_id'] = Variable<String>(poId.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (invoiceDate.present) {
      map['invoice_date'] = Variable<DateTime>(invoiceDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (bankAccountName.present) {
      map['bank_account_name'] = Variable<String>(bankAccountName.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (paymentTerms.present) {
      map['payment_terms'] = Variable<String>(paymentTerms.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('poId: $poId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('bankAccountName: $bankAccountName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankName: $bankName, ')
          ..write('paymentTerms: $paymentTerms, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PurchaseOrdersTableTable purchaseOrdersTable =
      $PurchaseOrdersTableTable(this);
  late final $PurchaseOrderItemsTableTable purchaseOrderItemsTable =
      $PurchaseOrderItemsTableTable(this);
  late final $FulfillmentBatchesTableTable fulfillmentBatchesTable =
      $FulfillmentBatchesTableTable(this);
  late final $FulfillmentItemsTableTable fulfillmentItemsTable =
      $FulfillmentItemsTableTable(this);
  late final $InvoicesTableTable invoicesTable = $InvoicesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    purchaseOrdersTable,
    purchaseOrderItemsTable,
    fulfillmentBatchesTable,
    fulfillmentItemsTable,
    invoicesTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'purchase_orders_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('purchase_order_items_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'purchase_orders_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('fulfillment_batches_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'fulfillment_batches_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('fulfillment_items_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'purchase_order_items_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('fulfillment_items_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'fulfillment_batches_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('invoices_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'purchase_orders_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('invoices_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PurchaseOrdersTableTableCreateCompanionBuilder =
    PurchaseOrdersTableCompanion Function({
      required String id,
      required String poNumber,
      Value<String> companyName,
      Value<String> vendorName,
      Value<String> deliveryDestination,
      required DateTime poDate,
      Value<DateTime?> deliveryDate,
      Value<String> status,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> tax,
      Value<double> grandTotal,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$PurchaseOrdersTableTableUpdateCompanionBuilder =
    PurchaseOrdersTableCompanion Function({
      Value<String> id,
      Value<String> poNumber,
      Value<String> companyName,
      Value<String> vendorName,
      Value<String> deliveryDestination,
      Value<DateTime> poDate,
      Value<DateTime?> deliveryDate,
      Value<String> status,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> tax,
      Value<double> grandTotal,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$PurchaseOrdersTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseOrdersTableTable,
          PurchaseOrdersTableData
        > {
  $$PurchaseOrdersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $PurchaseOrderItemsTableTable,
    List<PurchaseOrderItemsTableData>
  >
  _purchaseOrderItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseOrderItemsTable,
        aliasName: $_aliasNameGenerator(
          db.purchaseOrdersTable.id,
          db.purchaseOrderItemsTable.poId,
        ),
      );

  $$PurchaseOrderItemsTableTableProcessedTableManager
  get purchaseOrderItemsTableRefs {
    final manager = $$PurchaseOrderItemsTableTableTableManager(
      $_db,
      $_db.purchaseOrderItemsTable,
    ).filter((f) => f.poId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseOrderItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $FulfillmentBatchesTableTable,
    List<FulfillmentBatchesTableData>
  >
  _fulfillmentBatchesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.fulfillmentBatchesTable,
        aliasName: $_aliasNameGenerator(
          db.purchaseOrdersTable.id,
          db.fulfillmentBatchesTable.poId,
        ),
      );

  $$FulfillmentBatchesTableTableProcessedTableManager
  get fulfillmentBatchesTableRefs {
    final manager = $$FulfillmentBatchesTableTableTableManager(
      $_db,
      $_db.fulfillmentBatchesTable,
    ).filter((f) => f.poId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _fulfillmentBatchesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InvoicesTableTable, List<InvoicesTableData>>
  _invoicesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoicesTable,
    aliasName: $_aliasNameGenerator(
      db.purchaseOrdersTable.id,
      db.invoicesTable.poId,
    ),
  );

  $$InvoicesTableTableProcessedTableManager get invoicesTableRefs {
    final manager = $$InvoicesTableTableTableManager(
      $_db,
      $_db.invoicesTable,
    ).filter((f) => f.poId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PurchaseOrdersTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTableTable> {
  $$PurchaseOrdersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get poNumber => $composableBuilder(
    column: $table.poNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryDestination => $composableBuilder(
    column: $table.deliveryDestination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get poDate => $composableBuilder(
    column: $table.poDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> purchaseOrderItemsTableRefs(
    Expression<bool> Function($$PurchaseOrderItemsTableTableFilterComposer f) f,
  ) {
    final $$PurchaseOrderItemsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseOrderItemsTable,
          getReferencedColumn: (t) => t.poId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrderItemsTableTableFilterComposer(
                $db: $db,
                $table: $db.purchaseOrderItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> fulfillmentBatchesTableRefs(
    Expression<bool> Function($$FulfillmentBatchesTableTableFilterComposer f) f,
  ) {
    final $$FulfillmentBatchesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.poId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableFilterComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> invoicesTableRefs(
    Expression<bool> Function($$InvoicesTableTableFilterComposer f) f,
  ) {
    final $$InvoicesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoicesTable,
      getReferencedColumn: (t) => t.poId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableTableFilterComposer(
            $db: $db,
            $table: $db.invoicesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseOrdersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTableTable> {
  $$PurchaseOrdersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get poNumber => $composableBuilder(
    column: $table.poNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryDestination => $composableBuilder(
    column: $table.deliveryDestination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get poDate => $composableBuilder(
    column: $table.poDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseOrdersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTableTable> {
  $$PurchaseOrdersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get poNumber =>
      $composableBuilder(column: $table.poNumber, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deliveryDestination => $composableBuilder(
    column: $table.deliveryDestination,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get poDate =>
      $composableBuilder(column: $table.poDate, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get tax =>
      $composableBuilder(column: $table.tax, builder: (column) => column);

  GeneratedColumn<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> purchaseOrderItemsTableRefs<T extends Object>(
    Expression<T> Function($$PurchaseOrderItemsTableTableAnnotationComposer a)
    f,
  ) {
    final $$PurchaseOrderItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseOrderItemsTable,
          getReferencedColumn: (t) => t.poId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrderItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseOrderItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> fulfillmentBatchesTableRefs<T extends Object>(
    Expression<T> Function($$FulfillmentBatchesTableTableAnnotationComposer a)
    f,
  ) {
    final $$FulfillmentBatchesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.poId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> invoicesTableRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoicesTable,
      getReferencedColumn: (t) => t.poId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.invoicesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseOrdersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseOrdersTableTable,
          PurchaseOrdersTableData,
          $$PurchaseOrdersTableTableFilterComposer,
          $$PurchaseOrdersTableTableOrderingComposer,
          $$PurchaseOrdersTableTableAnnotationComposer,
          $$PurchaseOrdersTableTableCreateCompanionBuilder,
          $$PurchaseOrdersTableTableUpdateCompanionBuilder,
          (PurchaseOrdersTableData, $$PurchaseOrdersTableTableReferences),
          PurchaseOrdersTableData,
          PrefetchHooks Function({
            bool purchaseOrderItemsTableRefs,
            bool fulfillmentBatchesTableRefs,
            bool invoicesTableRefs,
          })
        > {
  $$PurchaseOrdersTableTableTableManager(
    _$AppDatabase db,
    $PurchaseOrdersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrdersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrdersTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PurchaseOrdersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poNumber = const Value.absent(),
                Value<String> companyName = const Value.absent(),
                Value<String> vendorName = const Value.absent(),
                Value<String> deliveryDestination = const Value.absent(),
                Value<DateTime> poDate = const Value.absent(),
                Value<DateTime?> deliveryDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> tax = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseOrdersTableCompanion(
                id: id,
                poNumber: poNumber,
                companyName: companyName,
                vendorName: vendorName,
                deliveryDestination: deliveryDestination,
                poDate: poDate,
                deliveryDate: deliveryDate,
                status: status,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                grandTotal: grandTotal,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poNumber,
                Value<String> companyName = const Value.absent(),
                Value<String> vendorName = const Value.absent(),
                Value<String> deliveryDestination = const Value.absent(),
                required DateTime poDate,
                Value<DateTime?> deliveryDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> tax = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseOrdersTableCompanion.insert(
                id: id,
                poNumber: poNumber,
                companyName: companyName,
                vendorName: vendorName,
                deliveryDestination: deliveryDestination,
                poDate: poDate,
                deliveryDate: deliveryDate,
                status: status,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                grandTotal: grandTotal,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchaseOrdersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                purchaseOrderItemsTableRefs = false,
                fulfillmentBatchesTableRefs = false,
                invoicesTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (purchaseOrderItemsTableRefs) db.purchaseOrderItemsTable,
                    if (fulfillmentBatchesTableRefs) db.fulfillmentBatchesTable,
                    if (invoicesTableRefs) db.invoicesTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (purchaseOrderItemsTableRefs)
                        await $_getPrefetchedData<
                          PurchaseOrdersTableData,
                          $PurchaseOrdersTableTable,
                          PurchaseOrderItemsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseOrdersTableTableReferences
                              ._purchaseOrderItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseOrdersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseOrderItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (fulfillmentBatchesTableRefs)
                        await $_getPrefetchedData<
                          PurchaseOrdersTableData,
                          $PurchaseOrdersTableTable,
                          FulfillmentBatchesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseOrdersTableTableReferences
                              ._fulfillmentBatchesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseOrdersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).fulfillmentBatchesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (invoicesTableRefs)
                        await $_getPrefetchedData<
                          PurchaseOrdersTableData,
                          $PurchaseOrdersTableTable,
                          InvoicesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseOrdersTableTableReferences
                              ._invoicesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseOrdersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PurchaseOrdersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseOrdersTableTable,
      PurchaseOrdersTableData,
      $$PurchaseOrdersTableTableFilterComposer,
      $$PurchaseOrdersTableTableOrderingComposer,
      $$PurchaseOrdersTableTableAnnotationComposer,
      $$PurchaseOrdersTableTableCreateCompanionBuilder,
      $$PurchaseOrdersTableTableUpdateCompanionBuilder,
      (PurchaseOrdersTableData, $$PurchaseOrdersTableTableReferences),
      PurchaseOrdersTableData,
      PrefetchHooks Function({
        bool purchaseOrderItemsTableRefs,
        bool fulfillmentBatchesTableRefs,
        bool invoicesTableRefs,
      })
    >;
typedef $$PurchaseOrderItemsTableTableCreateCompanionBuilder =
    PurchaseOrderItemsTableCompanion Function({
      required String id,
      required String poId,
      required int itemIndex,
      required String description,
      required double requestedQty,
      Value<String> uom,
      required double targetUnitPrice,
      required double targetTotalPrice,
      Value<String?> category,
      Value<int> rowid,
    });
typedef $$PurchaseOrderItemsTableTableUpdateCompanionBuilder =
    PurchaseOrderItemsTableCompanion Function({
      Value<String> id,
      Value<String> poId,
      Value<int> itemIndex,
      Value<String> description,
      Value<double> requestedQty,
      Value<String> uom,
      Value<double> targetUnitPrice,
      Value<double> targetTotalPrice,
      Value<String?> category,
      Value<int> rowid,
    });

final class $$PurchaseOrderItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseOrderItemsTableTable,
          PurchaseOrderItemsTableData
        > {
  $$PurchaseOrderItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseOrdersTableTable _poIdTable(_$AppDatabase db) =>
      db.purchaseOrdersTable.createAlias(
        $_aliasNameGenerator(
          db.purchaseOrderItemsTable.poId,
          db.purchaseOrdersTable.id,
        ),
      );

  $$PurchaseOrdersTableTableProcessedTableManager get poId {
    final $_column = $_itemColumn<String>('po_id')!;

    final manager = $$PurchaseOrdersTableTableTableManager(
      $_db,
      $_db.purchaseOrdersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $FulfillmentItemsTableTable,
    List<FulfillmentItemsTableData>
  >
  _fulfillmentItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.fulfillmentItemsTable,
        aliasName: $_aliasNameGenerator(
          db.purchaseOrderItemsTable.id,
          db.fulfillmentItemsTable.poItemId,
        ),
      );

  $$FulfillmentItemsTableTableProcessedTableManager
  get fulfillmentItemsTableRefs {
    final manager = $$FulfillmentItemsTableTableTableManager(
      $_db,
      $_db.fulfillmentItemsTable,
    ).filter((f) => f.poItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _fulfillmentItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PurchaseOrderItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTableTable> {
  $$PurchaseOrderItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get itemIndex => $composableBuilder(
    column: $table.itemIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get requestedQty => $composableBuilder(
    column: $table.requestedQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetUnitPrice => $composableBuilder(
    column: $table.targetUnitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetTotalPrice => $composableBuilder(
    column: $table.targetTotalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseOrdersTableTableFilterComposer get poId {
    final $$PurchaseOrdersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poId,
      referencedTable: $db.purchaseOrdersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseOrdersTableTableFilterComposer(
            $db: $db,
            $table: $db.purchaseOrdersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> fulfillmentItemsTableRefs(
    Expression<bool> Function($$FulfillmentItemsTableTableFilterComposer f) f,
  ) {
    final $$FulfillmentItemsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentItemsTable,
          getReferencedColumn: (t) => t.poItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentItemsTableTableFilterComposer(
                $db: $db,
                $table: $db.fulfillmentItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PurchaseOrderItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTableTable> {
  $$PurchaseOrderItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get itemIndex => $composableBuilder(
    column: $table.itemIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get requestedQty => $composableBuilder(
    column: $table.requestedQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetUnitPrice => $composableBuilder(
    column: $table.targetUnitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetTotalPrice => $composableBuilder(
    column: $table.targetTotalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseOrdersTableTableOrderingComposer get poId {
    final $$PurchaseOrdersTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableOrderingComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$PurchaseOrderItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTableTable> {
  $$PurchaseOrderItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get itemIndex =>
      $composableBuilder(column: $table.itemIndex, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get requestedQty => $composableBuilder(
    column: $table.requestedQty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get uom =>
      $composableBuilder(column: $table.uom, builder: (column) => column);

  GeneratedColumn<double> get targetUnitPrice => $composableBuilder(
    column: $table.targetUnitPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetTotalPrice => $composableBuilder(
    column: $table.targetTotalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  $$PurchaseOrdersTableTableAnnotationComposer get poId {
    final $$PurchaseOrdersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> fulfillmentItemsTableRefs<T extends Object>(
    Expression<T> Function($$FulfillmentItemsTableTableAnnotationComposer a) f,
  ) {
    final $$FulfillmentItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentItemsTable,
          getReferencedColumn: (t) => t.poItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fulfillmentItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PurchaseOrderItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseOrderItemsTableTable,
          PurchaseOrderItemsTableData,
          $$PurchaseOrderItemsTableTableFilterComposer,
          $$PurchaseOrderItemsTableTableOrderingComposer,
          $$PurchaseOrderItemsTableTableAnnotationComposer,
          $$PurchaseOrderItemsTableTableCreateCompanionBuilder,
          $$PurchaseOrderItemsTableTableUpdateCompanionBuilder,
          (
            PurchaseOrderItemsTableData,
            $$PurchaseOrderItemsTableTableReferences,
          ),
          PurchaseOrderItemsTableData,
          PrefetchHooks Function({bool poId, bool fulfillmentItemsTableRefs})
        > {
  $$PurchaseOrderItemsTableTableTableManager(
    _$AppDatabase db,
    $PurchaseOrderItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrderItemsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PurchaseOrderItemsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PurchaseOrderItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poId = const Value.absent(),
                Value<int> itemIndex = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> requestedQty = const Value.absent(),
                Value<String> uom = const Value.absent(),
                Value<double> targetUnitPrice = const Value.absent(),
                Value<double> targetTotalPrice = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseOrderItemsTableCompanion(
                id: id,
                poId: poId,
                itemIndex: itemIndex,
                description: description,
                requestedQty: requestedQty,
                uom: uom,
                targetUnitPrice: targetUnitPrice,
                targetTotalPrice: targetTotalPrice,
                category: category,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poId,
                required int itemIndex,
                required String description,
                required double requestedQty,
                Value<String> uom = const Value.absent(),
                required double targetUnitPrice,
                required double targetTotalPrice,
                Value<String?> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseOrderItemsTableCompanion.insert(
                id: id,
                poId: poId,
                itemIndex: itemIndex,
                description: description,
                requestedQty: requestedQty,
                uom: uom,
                targetUnitPrice: targetUnitPrice,
                targetTotalPrice: targetTotalPrice,
                category: category,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchaseOrderItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({poId = false, fulfillmentItemsTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fulfillmentItemsTableRefs) db.fulfillmentItemsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (poId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.poId,
                                    referencedTable:
                                        $$PurchaseOrderItemsTableTableReferences
                                            ._poIdTable(db),
                                    referencedColumn:
                                        $$PurchaseOrderItemsTableTableReferences
                                            ._poIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fulfillmentItemsTableRefs)
                        await $_getPrefetchedData<
                          PurchaseOrderItemsTableData,
                          $PurchaseOrderItemsTableTable,
                          FulfillmentItemsTableData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$PurchaseOrderItemsTableTableReferences
                                  ._fulfillmentItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseOrderItemsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).fulfillmentItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PurchaseOrderItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseOrderItemsTableTable,
      PurchaseOrderItemsTableData,
      $$PurchaseOrderItemsTableTableFilterComposer,
      $$PurchaseOrderItemsTableTableOrderingComposer,
      $$PurchaseOrderItemsTableTableAnnotationComposer,
      $$PurchaseOrderItemsTableTableCreateCompanionBuilder,
      $$PurchaseOrderItemsTableTableUpdateCompanionBuilder,
      (PurchaseOrderItemsTableData, $$PurchaseOrderItemsTableTableReferences),
      PurchaseOrderItemsTableData,
      PrefetchHooks Function({bool poId, bool fulfillmentItemsTableRefs})
    >;
typedef $$FulfillmentBatchesTableTableCreateCompanionBuilder =
    FulfillmentBatchesTableCompanion Function({
      required String id,
      required String poId,
      required String batchNumber,
      Value<String?> deliveryNoteNumber,
      Value<DateTime> fulfillmentDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FulfillmentBatchesTableTableUpdateCompanionBuilder =
    FulfillmentBatchesTableCompanion Function({
      Value<String> id,
      Value<String> poId,
      Value<String> batchNumber,
      Value<String?> deliveryNoteNumber,
      Value<DateTime> fulfillmentDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$FulfillmentBatchesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FulfillmentBatchesTableTable,
          FulfillmentBatchesTableData
        > {
  $$FulfillmentBatchesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseOrdersTableTable _poIdTable(_$AppDatabase db) =>
      db.purchaseOrdersTable.createAlias(
        $_aliasNameGenerator(
          db.fulfillmentBatchesTable.poId,
          db.purchaseOrdersTable.id,
        ),
      );

  $$PurchaseOrdersTableTableProcessedTableManager get poId {
    final $_column = $_itemColumn<String>('po_id')!;

    final manager = $$PurchaseOrdersTableTableTableManager(
      $_db,
      $_db.purchaseOrdersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $FulfillmentItemsTableTable,
    List<FulfillmentItemsTableData>
  >
  _fulfillmentItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.fulfillmentItemsTable,
        aliasName: $_aliasNameGenerator(
          db.fulfillmentBatchesTable.id,
          db.fulfillmentItemsTable.batchId,
        ),
      );

  $$FulfillmentItemsTableTableProcessedTableManager
  get fulfillmentItemsTableRefs {
    final manager = $$FulfillmentItemsTableTableTableManager(
      $_db,
      $_db.fulfillmentItemsTable,
    ).filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _fulfillmentItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InvoicesTableTable, List<InvoicesTableData>>
  _invoicesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoicesTable,
    aliasName: $_aliasNameGenerator(
      db.fulfillmentBatchesTable.id,
      db.invoicesTable.batchId,
    ),
  );

  $$InvoicesTableTableProcessedTableManager get invoicesTableRefs {
    final manager = $$InvoicesTableTableTableManager(
      $_db,
      $_db.invoicesTable,
    ).filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FulfillmentBatchesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FulfillmentBatchesTableTable> {
  $$FulfillmentBatchesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryNoteNumber => $composableBuilder(
    column: $table.deliveryNoteNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fulfillmentDate => $composableBuilder(
    column: $table.fulfillmentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseOrdersTableTableFilterComposer get poId {
    final $$PurchaseOrdersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poId,
      referencedTable: $db.purchaseOrdersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseOrdersTableTableFilterComposer(
            $db: $db,
            $table: $db.purchaseOrdersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> fulfillmentItemsTableRefs(
    Expression<bool> Function($$FulfillmentItemsTableTableFilterComposer f) f,
  ) {
    final $$FulfillmentItemsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentItemsTable,
          getReferencedColumn: (t) => t.batchId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentItemsTableTableFilterComposer(
                $db: $db,
                $table: $db.fulfillmentItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> invoicesTableRefs(
    Expression<bool> Function($$InvoicesTableTableFilterComposer f) f,
  ) {
    final $$InvoicesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoicesTable,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableTableFilterComposer(
            $db: $db,
            $table: $db.invoicesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FulfillmentBatchesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FulfillmentBatchesTableTable> {
  $$FulfillmentBatchesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryNoteNumber => $composableBuilder(
    column: $table.deliveryNoteNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fulfillmentDate => $composableBuilder(
    column: $table.fulfillmentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseOrdersTableTableOrderingComposer get poId {
    final $$PurchaseOrdersTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableOrderingComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$FulfillmentBatchesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FulfillmentBatchesTableTable> {
  $$FulfillmentBatchesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deliveryNoteNumber => $composableBuilder(
    column: $table.deliveryNoteNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fulfillmentDate => $composableBuilder(
    column: $table.fulfillmentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PurchaseOrdersTableTableAnnotationComposer get poId {
    final $$PurchaseOrdersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> fulfillmentItemsTableRefs<T extends Object>(
    Expression<T> Function($$FulfillmentItemsTableTableAnnotationComposer a) f,
  ) {
    final $$FulfillmentItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fulfillmentItemsTable,
          getReferencedColumn: (t) => t.batchId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fulfillmentItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> invoicesTableRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoicesTable,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.invoicesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FulfillmentBatchesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FulfillmentBatchesTableTable,
          FulfillmentBatchesTableData,
          $$FulfillmentBatchesTableTableFilterComposer,
          $$FulfillmentBatchesTableTableOrderingComposer,
          $$FulfillmentBatchesTableTableAnnotationComposer,
          $$FulfillmentBatchesTableTableCreateCompanionBuilder,
          $$FulfillmentBatchesTableTableUpdateCompanionBuilder,
          (
            FulfillmentBatchesTableData,
            $$FulfillmentBatchesTableTableReferences,
          ),
          FulfillmentBatchesTableData,
          PrefetchHooks Function({
            bool poId,
            bool fulfillmentItemsTableRefs,
            bool invoicesTableRefs,
          })
        > {
  $$FulfillmentBatchesTableTableTableManager(
    _$AppDatabase db,
    $FulfillmentBatchesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FulfillmentBatchesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FulfillmentBatchesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FulfillmentBatchesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poId = const Value.absent(),
                Value<String> batchNumber = const Value.absent(),
                Value<String?> deliveryNoteNumber = const Value.absent(),
                Value<DateTime> fulfillmentDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FulfillmentBatchesTableCompanion(
                id: id,
                poId: poId,
                batchNumber: batchNumber,
                deliveryNoteNumber: deliveryNoteNumber,
                fulfillmentDate: fulfillmentDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poId,
                required String batchNumber,
                Value<String?> deliveryNoteNumber = const Value.absent(),
                Value<DateTime> fulfillmentDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FulfillmentBatchesTableCompanion.insert(
                id: id,
                poId: poId,
                batchNumber: batchNumber,
                deliveryNoteNumber: deliveryNoteNumber,
                fulfillmentDate: fulfillmentDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FulfillmentBatchesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                poId = false,
                fulfillmentItemsTableRefs = false,
                invoicesTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fulfillmentItemsTableRefs) db.fulfillmentItemsTable,
                    if (invoicesTableRefs) db.invoicesTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (poId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.poId,
                                    referencedTable:
                                        $$FulfillmentBatchesTableTableReferences
                                            ._poIdTable(db),
                                    referencedColumn:
                                        $$FulfillmentBatchesTableTableReferences
                                            ._poIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fulfillmentItemsTableRefs)
                        await $_getPrefetchedData<
                          FulfillmentBatchesTableData,
                          $FulfillmentBatchesTableTable,
                          FulfillmentItemsTableData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$FulfillmentBatchesTableTableReferences
                                  ._fulfillmentItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FulfillmentBatchesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).fulfillmentItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.batchId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (invoicesTableRefs)
                        await $_getPrefetchedData<
                          FulfillmentBatchesTableData,
                          $FulfillmentBatchesTableTable,
                          InvoicesTableData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$FulfillmentBatchesTableTableReferences
                                  ._invoicesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FulfillmentBatchesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.batchId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FulfillmentBatchesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FulfillmentBatchesTableTable,
      FulfillmentBatchesTableData,
      $$FulfillmentBatchesTableTableFilterComposer,
      $$FulfillmentBatchesTableTableOrderingComposer,
      $$FulfillmentBatchesTableTableAnnotationComposer,
      $$FulfillmentBatchesTableTableCreateCompanionBuilder,
      $$FulfillmentBatchesTableTableUpdateCompanionBuilder,
      (FulfillmentBatchesTableData, $$FulfillmentBatchesTableTableReferences),
      FulfillmentBatchesTableData,
      PrefetchHooks Function({
        bool poId,
        bool fulfillmentItemsTableRefs,
        bool invoicesTableRefs,
      })
    >;
typedef $$FulfillmentItemsTableTableCreateCompanionBuilder =
    FulfillmentItemsTableCompanion Function({
      required String id,
      required String batchId,
      required String poItemId,
      Value<double> fulfilledQty,
      Value<double> billedUnitPrice,
      Value<double?> purchaseCostPrice,
      Value<double> finalTotalPrice,
      Value<String> status,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$FulfillmentItemsTableTableUpdateCompanionBuilder =
    FulfillmentItemsTableCompanion Function({
      Value<String> id,
      Value<String> batchId,
      Value<String> poItemId,
      Value<double> fulfilledQty,
      Value<double> billedUnitPrice,
      Value<double?> purchaseCostPrice,
      Value<double> finalTotalPrice,
      Value<String> status,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$FulfillmentItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FulfillmentItemsTableTable,
          FulfillmentItemsTableData
        > {
  $$FulfillmentItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FulfillmentBatchesTableTable _batchIdTable(_$AppDatabase db) =>
      db.fulfillmentBatchesTable.createAlias(
        $_aliasNameGenerator(
          db.fulfillmentItemsTable.batchId,
          db.fulfillmentBatchesTable.id,
        ),
      );

  $$FulfillmentBatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$FulfillmentBatchesTableTableTableManager(
      $_db,
      $_db.fulfillmentBatchesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PurchaseOrderItemsTableTable _poItemIdTable(_$AppDatabase db) =>
      db.purchaseOrderItemsTable.createAlias(
        $_aliasNameGenerator(
          db.fulfillmentItemsTable.poItemId,
          db.purchaseOrderItemsTable.id,
        ),
      );

  $$PurchaseOrderItemsTableTableProcessedTableManager get poItemId {
    final $_column = $_itemColumn<String>('po_item_id')!;

    final manager = $$PurchaseOrderItemsTableTableTableManager(
      $_db,
      $_db.purchaseOrderItemsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FulfillmentItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FulfillmentItemsTableTable> {
  $$FulfillmentItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fulfilledQty => $composableBuilder(
    column: $table.fulfilledQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get billedUnitPrice => $composableBuilder(
    column: $table.billedUnitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchaseCostPrice => $composableBuilder(
    column: $table.purchaseCostPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalTotalPrice => $composableBuilder(
    column: $table.finalTotalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$FulfillmentBatchesTableTableFilterComposer get batchId {
    final $$FulfillmentBatchesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableFilterComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrderItemsTableTableFilterComposer get poItemId {
    final $$PurchaseOrderItemsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poItemId,
          referencedTable: $db.purchaseOrderItemsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrderItemsTableTableFilterComposer(
                $db: $db,
                $table: $db.purchaseOrderItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$FulfillmentItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FulfillmentItemsTableTable> {
  $$FulfillmentItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fulfilledQty => $composableBuilder(
    column: $table.fulfilledQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get billedUnitPrice => $composableBuilder(
    column: $table.billedUnitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchaseCostPrice => $composableBuilder(
    column: $table.purchaseCostPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalTotalPrice => $composableBuilder(
    column: $table.finalTotalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$FulfillmentBatchesTableTableOrderingComposer get batchId {
    final $$FulfillmentBatchesTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableOrderingComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrderItemsTableTableOrderingComposer get poItemId {
    final $$PurchaseOrderItemsTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poItemId,
          referencedTable: $db.purchaseOrderItemsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrderItemsTableTableOrderingComposer(
                $db: $db,
                $table: $db.purchaseOrderItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$FulfillmentItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FulfillmentItemsTableTable> {
  $$FulfillmentItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get fulfilledQty => $composableBuilder(
    column: $table.fulfilledQty,
    builder: (column) => column,
  );

  GeneratedColumn<double> get billedUnitPrice => $composableBuilder(
    column: $table.billedUnitPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get purchaseCostPrice => $composableBuilder(
    column: $table.purchaseCostPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get finalTotalPrice => $composableBuilder(
    column: $table.finalTotalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$FulfillmentBatchesTableTableAnnotationComposer get batchId {
    final $$FulfillmentBatchesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrderItemsTableTableAnnotationComposer get poItemId {
    final $$PurchaseOrderItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poItemId,
          referencedTable: $db.purchaseOrderItemsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrderItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseOrderItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$FulfillmentItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FulfillmentItemsTableTable,
          FulfillmentItemsTableData,
          $$FulfillmentItemsTableTableFilterComposer,
          $$FulfillmentItemsTableTableOrderingComposer,
          $$FulfillmentItemsTableTableAnnotationComposer,
          $$FulfillmentItemsTableTableCreateCompanionBuilder,
          $$FulfillmentItemsTableTableUpdateCompanionBuilder,
          (FulfillmentItemsTableData, $$FulfillmentItemsTableTableReferences),
          FulfillmentItemsTableData,
          PrefetchHooks Function({bool batchId, bool poItemId})
        > {
  $$FulfillmentItemsTableTableTableManager(
    _$AppDatabase db,
    $FulfillmentItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FulfillmentItemsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FulfillmentItemsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FulfillmentItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<String> poItemId = const Value.absent(),
                Value<double> fulfilledQty = const Value.absent(),
                Value<double> billedUnitPrice = const Value.absent(),
                Value<double?> purchaseCostPrice = const Value.absent(),
                Value<double> finalTotalPrice = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FulfillmentItemsTableCompanion(
                id: id,
                batchId: batchId,
                poItemId: poItemId,
                fulfilledQty: fulfilledQty,
                billedUnitPrice: billedUnitPrice,
                purchaseCostPrice: purchaseCostPrice,
                finalTotalPrice: finalTotalPrice,
                status: status,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String batchId,
                required String poItemId,
                Value<double> fulfilledQty = const Value.absent(),
                Value<double> billedUnitPrice = const Value.absent(),
                Value<double?> purchaseCostPrice = const Value.absent(),
                Value<double> finalTotalPrice = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FulfillmentItemsTableCompanion.insert(
                id: id,
                batchId: batchId,
                poItemId: poItemId,
                fulfilledQty: fulfilledQty,
                billedUnitPrice: billedUnitPrice,
                purchaseCostPrice: purchaseCostPrice,
                finalTotalPrice: finalTotalPrice,
                status: status,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FulfillmentItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({batchId = false, poItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (batchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.batchId,
                                referencedTable:
                                    $$FulfillmentItemsTableTableReferences
                                        ._batchIdTable(db),
                                referencedColumn:
                                    $$FulfillmentItemsTableTableReferences
                                        ._batchIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (poItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poItemId,
                                referencedTable:
                                    $$FulfillmentItemsTableTableReferences
                                        ._poItemIdTable(db),
                                referencedColumn:
                                    $$FulfillmentItemsTableTableReferences
                                        ._poItemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FulfillmentItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FulfillmentItemsTableTable,
      FulfillmentItemsTableData,
      $$FulfillmentItemsTableTableFilterComposer,
      $$FulfillmentItemsTableTableOrderingComposer,
      $$FulfillmentItemsTableTableAnnotationComposer,
      $$FulfillmentItemsTableTableCreateCompanionBuilder,
      $$FulfillmentItemsTableTableUpdateCompanionBuilder,
      (FulfillmentItemsTableData, $$FulfillmentItemsTableTableReferences),
      FulfillmentItemsTableData,
      PrefetchHooks Function({bool batchId, bool poItemId})
    >;
typedef $$InvoicesTableTableCreateCompanionBuilder =
    InvoicesTableCompanion Function({
      required String id,
      required String batchId,
      required String poId,
      required String invoiceNumber,
      Value<DateTime> invoiceDate,
      Value<DateTime?> dueDate,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> tax,
      Value<double> grandTotal,
      Value<String?> bankAccountName,
      Value<String?> bankAccountNumber,
      Value<String?> bankName,
      Value<String?> paymentTerms,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$InvoicesTableTableUpdateCompanionBuilder =
    InvoicesTableCompanion Function({
      Value<String> id,
      Value<String> batchId,
      Value<String> poId,
      Value<String> invoiceNumber,
      Value<DateTime> invoiceDate,
      Value<DateTime?> dueDate,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> tax,
      Value<double> grandTotal,
      Value<String?> bankAccountName,
      Value<String?> bankAccountNumber,
      Value<String?> bankName,
      Value<String?> paymentTerms,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$InvoicesTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $InvoicesTableTable, InvoicesTableData> {
  $$InvoicesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FulfillmentBatchesTableTable _batchIdTable(_$AppDatabase db) =>
      db.fulfillmentBatchesTable.createAlias(
        $_aliasNameGenerator(
          db.invoicesTable.batchId,
          db.fulfillmentBatchesTable.id,
        ),
      );

  $$FulfillmentBatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$FulfillmentBatchesTableTableTableManager(
      $_db,
      $_db.fulfillmentBatchesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PurchaseOrdersTableTable _poIdTable(_$AppDatabase db) =>
      db.purchaseOrdersTable.createAlias(
        $_aliasNameGenerator(db.invoicesTable.poId, db.purchaseOrdersTable.id),
      );

  $$PurchaseOrdersTableTableProcessedTableManager get poId {
    final $_column = $_itemColumn<String>('po_id')!;

    final manager = $$PurchaseOrdersTableTableTableManager(
      $_db,
      $_db.purchaseOrdersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoicesTableTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankAccountName => $composableBuilder(
    column: $table.bankAccountName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankAccountNumber => $composableBuilder(
    column: $table.bankAccountNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FulfillmentBatchesTableTableFilterComposer get batchId {
    final $$FulfillmentBatchesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableFilterComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrdersTableTableFilterComposer get poId {
    final $$PurchaseOrdersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poId,
      referencedTable: $db.purchaseOrdersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseOrdersTableTableFilterComposer(
            $db: $db,
            $table: $db.purchaseOrdersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoicesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankAccountName => $composableBuilder(
    column: $table.bankAccountName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankAccountNumber => $composableBuilder(
    column: $table.bankAccountNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FulfillmentBatchesTableTableOrderingComposer get batchId {
    final $$FulfillmentBatchesTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableOrderingComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrdersTableTableOrderingComposer get poId {
    final $$PurchaseOrdersTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableOrderingComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InvoicesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get tax =>
      $composableBuilder(column: $table.tax, builder: (column) => column);

  GeneratedColumn<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankAccountName => $composableBuilder(
    column: $table.bankAccountName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankAccountNumber => $composableBuilder(
    column: $table.bankAccountNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$FulfillmentBatchesTableTableAnnotationComposer get batchId {
    final $$FulfillmentBatchesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.fulfillmentBatchesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FulfillmentBatchesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fulfillmentBatchesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$PurchaseOrdersTableTableAnnotationComposer get poId {
    final $$PurchaseOrdersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.poId,
          referencedTable: $db.purchaseOrdersTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseOrdersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseOrdersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InvoicesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTableTable,
          InvoicesTableData,
          $$InvoicesTableTableFilterComposer,
          $$InvoicesTableTableOrderingComposer,
          $$InvoicesTableTableAnnotationComposer,
          $$InvoicesTableTableCreateCompanionBuilder,
          $$InvoicesTableTableUpdateCompanionBuilder,
          (InvoicesTableData, $$InvoicesTableTableReferences),
          InvoicesTableData,
          PrefetchHooks Function({bool batchId, bool poId})
        > {
  $$InvoicesTableTableTableManager(_$AppDatabase db, $InvoicesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<String> poId = const Value.absent(),
                Value<String> invoiceNumber = const Value.absent(),
                Value<DateTime> invoiceDate = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> tax = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> bankAccountName = const Value.absent(),
                Value<String?> bankAccountNumber = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> paymentTerms = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesTableCompanion(
                id: id,
                batchId: batchId,
                poId: poId,
                invoiceNumber: invoiceNumber,
                invoiceDate: invoiceDate,
                dueDate: dueDate,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                grandTotal: grandTotal,
                bankAccountName: bankAccountName,
                bankAccountNumber: bankAccountNumber,
                bankName: bankName,
                paymentTerms: paymentTerms,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String batchId,
                required String poId,
                required String invoiceNumber,
                Value<DateTime> invoiceDate = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> tax = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> bankAccountName = const Value.absent(),
                Value<String?> bankAccountNumber = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> paymentTerms = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesTableCompanion.insert(
                id: id,
                batchId: batchId,
                poId: poId,
                invoiceNumber: invoiceNumber,
                invoiceDate: invoiceDate,
                dueDate: dueDate,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                grandTotal: grandTotal,
                bankAccountName: bankAccountName,
                bankAccountNumber: bankAccountNumber,
                bankName: bankName,
                paymentTerms: paymentTerms,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({batchId = false, poId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (batchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.batchId,
                                referencedTable: $$InvoicesTableTableReferences
                                    ._batchIdTable(db),
                                referencedColumn: $$InvoicesTableTableReferences
                                    ._batchIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (poId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poId,
                                referencedTable: $$InvoicesTableTableReferences
                                    ._poIdTable(db),
                                referencedColumn: $$InvoicesTableTableReferences
                                    ._poIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoicesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTableTable,
      InvoicesTableData,
      $$InvoicesTableTableFilterComposer,
      $$InvoicesTableTableOrderingComposer,
      $$InvoicesTableTableAnnotationComposer,
      $$InvoicesTableTableCreateCompanionBuilder,
      $$InvoicesTableTableUpdateCompanionBuilder,
      (InvoicesTableData, $$InvoicesTableTableReferences),
      InvoicesTableData,
      PrefetchHooks Function({bool batchId, bool poId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PurchaseOrdersTableTableTableManager get purchaseOrdersTable =>
      $$PurchaseOrdersTableTableTableManager(_db, _db.purchaseOrdersTable);
  $$PurchaseOrderItemsTableTableTableManager get purchaseOrderItemsTable =>
      $$PurchaseOrderItemsTableTableTableManager(
        _db,
        _db.purchaseOrderItemsTable,
      );
  $$FulfillmentBatchesTableTableTableManager get fulfillmentBatchesTable =>
      $$FulfillmentBatchesTableTableTableManager(
        _db,
        _db.fulfillmentBatchesTable,
      );
  $$FulfillmentItemsTableTableTableManager get fulfillmentItemsTable =>
      $$FulfillmentItemsTableTableTableManager(_db, _db.fulfillmentItemsTable);
  $$InvoicesTableTableTableManager get invoicesTable =>
      $$InvoicesTableTableTableManager(_db, _db.invoicesTable);
}
