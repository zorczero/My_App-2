// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BarangTable extends Barang with TableInfo<$BarangTable, BarangData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarangTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _kodeMeta = const VerificationMeta('kode');
  @override
  late final GeneratedColumn<String> kode = GeneratedColumn<String>(
      'kode', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _modalMeta = const VerificationMeta('modal');
  @override
  late final GeneratedColumn<int> modal = GeneratedColumn<int>(
      'modal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _harga_jualMeta =
      const VerificationMeta('harga_jual');
  @override
  late final GeneratedColumn<int> harga_jual = GeneratedColumn<int>(
      'harga_jual', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, kode, modal, harga_jual, stock, type, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barang';
  @override
  VerificationContext validateIntegrity(Insertable<BarangData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kode')) {
      context.handle(
          _kodeMeta, kode.isAcceptableOrUnknown(data['kode']!, _kodeMeta));
    } else if (isInserting) {
      context.missing(_kodeMeta);
    }
    if (data.containsKey('modal')) {
      context.handle(
          _modalMeta, modal.isAcceptableOrUnknown(data['modal']!, _modalMeta));
    } else if (isInserting) {
      context.missing(_modalMeta);
    }
    if (data.containsKey('harga_jual')) {
      context.handle(
          _harga_jualMeta,
          harga_jual.isAcceptableOrUnknown(
              data['harga_jual']!, _harga_jualMeta));
    } else if (isInserting) {
      context.missing(_harga_jualMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BarangData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarangData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      kode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kode'])!,
      modal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modal'])!,
      harga_jual: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}harga_jual'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BarangTable createAlias(String alias) {
    return $BarangTable(attachedDatabase, alias);
  }
}

class BarangData extends DataClass implements Insertable<BarangData> {
  final int id;
  final String name;
  final String kode;
  final int modal;
  final int harga_jual;
  final int stock;
  final int type;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BarangData(
      {required this.id,
      required this.name,
      required this.kode,
      required this.modal,
      required this.harga_jual,
      required this.stock,
      required this.type,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['kode'] = Variable<String>(kode);
    map['modal'] = Variable<int>(modal);
    map['harga_jual'] = Variable<int>(harga_jual);
    map['stock'] = Variable<int>(stock);
    map['type'] = Variable<int>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BarangCompanion toCompanion(bool nullToAbsent) {
    return BarangCompanion(
      id: Value(id),
      name: Value(name),
      kode: Value(kode),
      modal: Value(modal),
      harga_jual: Value(harga_jual),
      stock: Value(stock),
      type: Value(type),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BarangData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BarangData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kode: serializer.fromJson<String>(json['kode']),
      modal: serializer.fromJson<int>(json['modal']),
      harga_jual: serializer.fromJson<int>(json['harga_jual']),
      stock: serializer.fromJson<int>(json['stock']),
      type: serializer.fromJson<int>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'kode': serializer.toJson<String>(kode),
      'modal': serializer.toJson<int>(modal),
      'harga_jual': serializer.toJson<int>(harga_jual),
      'stock': serializer.toJson<int>(stock),
      'type': serializer.toJson<int>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BarangData copyWith(
          {int? id,
          String? name,
          String? kode,
          int? modal,
          int? harga_jual,
          int? stock,
          int? type,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BarangData(
        id: id ?? this.id,
        name: name ?? this.name,
        kode: kode ?? this.kode,
        modal: modal ?? this.modal,
        harga_jual: harga_jual ?? this.harga_jual,
        stock: stock ?? this.stock,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BarangData copyWithCompanion(BarangCompanion data) {
    return BarangData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kode: data.kode.present ? data.kode.value : this.kode,
      modal: data.modal.present ? data.modal.value : this.modal,
      harga_jual:
          data.harga_jual.present ? data.harga_jual.value : this.harga_jual,
      stock: data.stock.present ? data.stock.value : this.stock,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BarangData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kode: $kode, ')
          ..write('modal: $modal, ')
          ..write('harga_jual: $harga_jual, ')
          ..write('stock: $stock, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, kode, modal, harga_jual, stock, type, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BarangData &&
          other.id == this.id &&
          other.name == this.name &&
          other.kode == this.kode &&
          other.modal == this.modal &&
          other.harga_jual == this.harga_jual &&
          other.stock == this.stock &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BarangCompanion extends UpdateCompanion<BarangData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> kode;
  final Value<int> modal;
  final Value<int> harga_jual;
  final Value<int> stock;
  final Value<int> type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BarangCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kode = const Value.absent(),
    this.modal = const Value.absent(),
    this.harga_jual = const Value.absent(),
    this.stock = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BarangCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String kode,
    required int modal,
    required int harga_jual,
    required int stock,
    required int type,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : name = Value(name),
        kode = Value(kode),
        modal = Value(modal),
        harga_jual = Value(harga_jual),
        stock = Value(stock),
        type = Value(type),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BarangData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? kode,
    Expression<int>? modal,
    Expression<int>? harga_jual,
    Expression<int>? stock,
    Expression<int>? type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kode != null) 'kode': kode,
      if (modal != null) 'modal': modal,
      if (harga_jual != null) 'harga_jual': harga_jual,
      if (stock != null) 'stock': stock,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BarangCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? kode,
      Value<int>? modal,
      Value<int>? harga_jual,
      Value<int>? stock,
      Value<int>? type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BarangCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kode: kode ?? this.kode,
      modal: modal ?? this.modal,
      harga_jual: harga_jual ?? this.harga_jual,
      stock: stock ?? this.stock,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kode.present) {
      map['kode'] = Variable<String>(kode.value);
    }
    if (modal.present) {
      map['modal'] = Variable<int>(modal.value);
    }
    if (harga_jual.present) {
      map['harga_jual'] = Variable<int>(harga_jual.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarangCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kode: $kode, ')
          ..write('modal: $modal, ')
          ..write('harga_jual: $harga_jual, ')
          ..write('stock: $stock, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransaksiTable extends Transaksi
    with TableInfo<$TransaksiTable, TransaksiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransaksiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _transactionHutangIdMeta =
      const VerificationMeta('transactionHutangId');
  @override
  late final GeneratedColumn<int> transactionHutangId = GeneratedColumn<int>(
      'transaction_hutang_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _barangMeta = const VerificationMeta('barang');
  @override
  late final GeneratedColumn<String> barang = GeneratedColumn<String>(
      'barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hargaBarangMeta =
      const VerificationMeta('hargaBarang');
  @override
  late final GeneratedColumn<String> hargaBarang = GeneratedColumn<String>(
      'harga_barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jumlahBarangMeta =
      const VerificationMeta('jumlahBarang');
  @override
  late final GeneratedColumn<String> jumlahBarang = GeneratedColumn<String>(
      'jumlah_barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subTotalHargaMeta =
      const VerificationMeta('subTotalHarga');
  @override
  late final GeneratedColumn<int> subTotalHarga = GeneratedColumn<int>(
      'sub_total_harga', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalHargaMeta =
      const VerificationMeta('totalHarga');
  @override
  late final GeneratedColumn<int> totalHarga = GeneratedColumn<int>(
      'total_harga', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'));
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionHutangId,
        barang,
        hargaBarang,
        jumlahBarang,
        subTotalHarga,
        totalHarga,
        isPaid,
        dueDate,
        customerName,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaksi';
  @override
  VerificationContext validateIntegrity(Insertable<TransaksiData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_hutang_id')) {
      context.handle(
          _transactionHutangIdMeta,
          transactionHutangId.isAcceptableOrUnknown(
              data['transaction_hutang_id']!, _transactionHutangIdMeta));
    }
    if (data.containsKey('barang')) {
      context.handle(_barangMeta,
          barang.isAcceptableOrUnknown(data['barang']!, _barangMeta));
    } else if (isInserting) {
      context.missing(_barangMeta);
    }
    if (data.containsKey('harga_barang')) {
      context.handle(
          _hargaBarangMeta,
          hargaBarang.isAcceptableOrUnknown(
              data['harga_barang']!, _hargaBarangMeta));
    } else if (isInserting) {
      context.missing(_hargaBarangMeta);
    }
    if (data.containsKey('jumlah_barang')) {
      context.handle(
          _jumlahBarangMeta,
          jumlahBarang.isAcceptableOrUnknown(
              data['jumlah_barang']!, _jumlahBarangMeta));
    } else if (isInserting) {
      context.missing(_jumlahBarangMeta);
    }
    if (data.containsKey('sub_total_harga')) {
      context.handle(
          _subTotalHargaMeta,
          subTotalHarga.isAcceptableOrUnknown(
              data['sub_total_harga']!, _subTotalHargaMeta));
    } else if (isInserting) {
      context.missing(_subTotalHargaMeta);
    }
    if (data.containsKey('total_harga')) {
      context.handle(
          _totalHargaMeta,
          totalHarga.isAcceptableOrUnknown(
              data['total_harga']!, _totalHargaMeta));
    } else if (isInserting) {
      context.missing(_totalHargaMeta);
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    } else if (isInserting) {
      context.missing(_isPaidMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransaksiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransaksiData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      transactionHutangId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}transaction_hutang_id']),
      barang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barang'])!,
      hargaBarang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}harga_barang'])!,
      jumlahBarang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}jumlah_barang'])!,
      subTotalHarga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_total_harga'])!,
      totalHarga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_harga'])!,
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransaksiTable createAlias(String alias) {
    return $TransaksiTable(attachedDatabase, alias);
  }
}

class TransaksiData extends DataClass implements Insertable<TransaksiData> {
  final int id;
  final int? transactionHutangId;
  final String barang;
  final String hargaBarang;
  final String jumlahBarang;
  final int subTotalHarga;
  final int totalHarga;
  final bool isPaid;
  final DateTime? dueDate;
  final String? customerName;
  final DateTime createdAt;
  const TransaksiData(
      {required this.id,
      this.transactionHutangId,
      required this.barang,
      required this.hargaBarang,
      required this.jumlahBarang,
      required this.subTotalHarga,
      required this.totalHarga,
      required this.isPaid,
      this.dueDate,
      this.customerName,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || transactionHutangId != null) {
      map['transaction_hutang_id'] = Variable<int>(transactionHutangId);
    }
    map['barang'] = Variable<String>(barang);
    map['harga_barang'] = Variable<String>(hargaBarang);
    map['jumlah_barang'] = Variable<String>(jumlahBarang);
    map['sub_total_harga'] = Variable<int>(subTotalHarga);
    map['total_harga'] = Variable<int>(totalHarga);
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransaksiCompanion toCompanion(bool nullToAbsent) {
    return TransaksiCompanion(
      id: Value(id),
      transactionHutangId: transactionHutangId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionHutangId),
      barang: Value(barang),
      hargaBarang: Value(hargaBarang),
      jumlahBarang: Value(jumlahBarang),
      subTotalHarga: Value(subTotalHarga),
      totalHarga: Value(totalHarga),
      isPaid: Value(isPaid),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      createdAt: Value(createdAt),
    );
  }

  factory TransaksiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransaksiData(
      id: serializer.fromJson<int>(json['id']),
      transactionHutangId:
          serializer.fromJson<int?>(json['transactionHutangId']),
      barang: serializer.fromJson<String>(json['barang']),
      hargaBarang: serializer.fromJson<String>(json['hargaBarang']),
      jumlahBarang: serializer.fromJson<String>(json['jumlahBarang']),
      subTotalHarga: serializer.fromJson<int>(json['subTotalHarga']),
      totalHarga: serializer.fromJson<int>(json['totalHarga']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionHutangId': serializer.toJson<int?>(transactionHutangId),
      'barang': serializer.toJson<String>(barang),
      'hargaBarang': serializer.toJson<String>(hargaBarang),
      'jumlahBarang': serializer.toJson<String>(jumlahBarang),
      'subTotalHarga': serializer.toJson<int>(subTotalHarga),
      'totalHarga': serializer.toJson<int>(totalHarga),
      'isPaid': serializer.toJson<bool>(isPaid),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'customerName': serializer.toJson<String?>(customerName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransaksiData copyWith(
          {int? id,
          Value<int?> transactionHutangId = const Value.absent(),
          String? barang,
          String? hargaBarang,
          String? jumlahBarang,
          int? subTotalHarga,
          int? totalHarga,
          bool? isPaid,
          Value<DateTime?> dueDate = const Value.absent(),
          Value<String?> customerName = const Value.absent(),
          DateTime? createdAt}) =>
      TransaksiData(
        id: id ?? this.id,
        transactionHutangId: transactionHutangId.present
            ? transactionHutangId.value
            : this.transactionHutangId,
        barang: barang ?? this.barang,
        hargaBarang: hargaBarang ?? this.hargaBarang,
        jumlahBarang: jumlahBarang ?? this.jumlahBarang,
        subTotalHarga: subTotalHarga ?? this.subTotalHarga,
        totalHarga: totalHarga ?? this.totalHarga,
        isPaid: isPaid ?? this.isPaid,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        customerName:
            customerName.present ? customerName.value : this.customerName,
        createdAt: createdAt ?? this.createdAt,
      );
  TransaksiData copyWithCompanion(TransaksiCompanion data) {
    return TransaksiData(
      id: data.id.present ? data.id.value : this.id,
      transactionHutangId: data.transactionHutangId.present
          ? data.transactionHutangId.value
          : this.transactionHutangId,
      barang: data.barang.present ? data.barang.value : this.barang,
      hargaBarang:
          data.hargaBarang.present ? data.hargaBarang.value : this.hargaBarang,
      jumlahBarang: data.jumlahBarang.present
          ? data.jumlahBarang.value
          : this.jumlahBarang,
      subTotalHarga: data.subTotalHarga.present
          ? data.subTotalHarga.value
          : this.subTotalHarga,
      totalHarga:
          data.totalHarga.present ? data.totalHarga.value : this.totalHarga,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransaksiData(')
          ..write('id: $id, ')
          ..write('transactionHutangId: $transactionHutangId, ')
          ..write('barang: $barang, ')
          ..write('hargaBarang: $hargaBarang, ')
          ..write('jumlahBarang: $jumlahBarang, ')
          ..write('subTotalHarga: $subTotalHarga, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('isPaid: $isPaid, ')
          ..write('dueDate: $dueDate, ')
          ..write('customerName: $customerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      transactionHutangId,
      barang,
      hargaBarang,
      jumlahBarang,
      subTotalHarga,
      totalHarga,
      isPaid,
      dueDate,
      customerName,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransaksiData &&
          other.id == this.id &&
          other.transactionHutangId == this.transactionHutangId &&
          other.barang == this.barang &&
          other.hargaBarang == this.hargaBarang &&
          other.jumlahBarang == this.jumlahBarang &&
          other.subTotalHarga == this.subTotalHarga &&
          other.totalHarga == this.totalHarga &&
          other.isPaid == this.isPaid &&
          other.dueDate == this.dueDate &&
          other.customerName == this.customerName &&
          other.createdAt == this.createdAt);
}

class TransaksiCompanion extends UpdateCompanion<TransaksiData> {
  final Value<int> id;
  final Value<int?> transactionHutangId;
  final Value<String> barang;
  final Value<String> hargaBarang;
  final Value<String> jumlahBarang;
  final Value<int> subTotalHarga;
  final Value<int> totalHarga;
  final Value<bool> isPaid;
  final Value<DateTime?> dueDate;
  final Value<String?> customerName;
  final Value<DateTime> createdAt;
  const TransaksiCompanion({
    this.id = const Value.absent(),
    this.transactionHutangId = const Value.absent(),
    this.barang = const Value.absent(),
    this.hargaBarang = const Value.absent(),
    this.jumlahBarang = const Value.absent(),
    this.subTotalHarga = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.customerName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransaksiCompanion.insert({
    this.id = const Value.absent(),
    this.transactionHutangId = const Value.absent(),
    required String barang,
    required String hargaBarang,
    required String jumlahBarang,
    required int subTotalHarga,
    required int totalHarga,
    required bool isPaid,
    this.dueDate = const Value.absent(),
    this.customerName = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : barang = Value(barang),
        hargaBarang = Value(hargaBarang),
        jumlahBarang = Value(jumlahBarang),
        subTotalHarga = Value(subTotalHarga),
        totalHarga = Value(totalHarga),
        isPaid = Value(isPaid);
  static Insertable<TransaksiData> custom({
    Expression<int>? id,
    Expression<int>? transactionHutangId,
    Expression<String>? barang,
    Expression<String>? hargaBarang,
    Expression<String>? jumlahBarang,
    Expression<int>? subTotalHarga,
    Expression<int>? totalHarga,
    Expression<bool>? isPaid,
    Expression<DateTime>? dueDate,
    Expression<String>? customerName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionHutangId != null)
        'transaction_hutang_id': transactionHutangId,
      if (barang != null) 'barang': barang,
      if (hargaBarang != null) 'harga_barang': hargaBarang,
      if (jumlahBarang != null) 'jumlah_barang': jumlahBarang,
      if (subTotalHarga != null) 'sub_total_harga': subTotalHarga,
      if (totalHarga != null) 'total_harga': totalHarga,
      if (isPaid != null) 'is_paid': isPaid,
      if (dueDate != null) 'due_date': dueDate,
      if (customerName != null) 'customer_name': customerName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransaksiCompanion copyWith(
      {Value<int>? id,
      Value<int?>? transactionHutangId,
      Value<String>? barang,
      Value<String>? hargaBarang,
      Value<String>? jumlahBarang,
      Value<int>? subTotalHarga,
      Value<int>? totalHarga,
      Value<bool>? isPaid,
      Value<DateTime?>? dueDate,
      Value<String?>? customerName,
      Value<DateTime>? createdAt}) {
    return TransaksiCompanion(
      id: id ?? this.id,
      transactionHutangId: transactionHutangId ?? this.transactionHutangId,
      barang: barang ?? this.barang,
      hargaBarang: hargaBarang ?? this.hargaBarang,
      jumlahBarang: jumlahBarang ?? this.jumlahBarang,
      subTotalHarga: subTotalHarga ?? this.subTotalHarga,
      totalHarga: totalHarga ?? this.totalHarga,
      isPaid: isPaid ?? this.isPaid,
      dueDate: dueDate ?? this.dueDate,
      customerName: customerName ?? this.customerName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionHutangId.present) {
      map['transaction_hutang_id'] = Variable<int>(transactionHutangId.value);
    }
    if (barang.present) {
      map['barang'] = Variable<String>(barang.value);
    }
    if (hargaBarang.present) {
      map['harga_barang'] = Variable<String>(hargaBarang.value);
    }
    if (jumlahBarang.present) {
      map['jumlah_barang'] = Variable<String>(jumlahBarang.value);
    }
    if (subTotalHarga.present) {
      map['sub_total_harga'] = Variable<int>(subTotalHarga.value);
    }
    if (totalHarga.present) {
      map['total_harga'] = Variable<int>(totalHarga.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransaksiCompanion(')
          ..write('id: $id, ')
          ..write('transactionHutangId: $transactionHutangId, ')
          ..write('barang: $barang, ')
          ..write('hargaBarang: $hargaBarang, ')
          ..write('jumlahBarang: $jumlahBarang, ')
          ..write('subTotalHarga: $subTotalHarga, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('isPaid: $isPaid, ')
          ..write('dueDate: $dueDate, ')
          ..write('customerName: $customerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PelangganTable extends Pelanggan
    with TableInfo<$PelangganTable, PelangganData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PelangganTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
      'nama', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hutangMeta = const VerificationMeta('hutang');
  @override
  late final GeneratedColumn<int> hutang = GeneratedColumn<int>(
      'hutang', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, nama, hutang, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pelanggan';
  @override
  VerificationContext validateIntegrity(Insertable<PelangganData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('hutang')) {
      context.handle(_hutangMeta,
          hutang.isAcceptableOrUnknown(data['hutang']!, _hutangMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PelangganData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PelangganData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      hutang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hutang'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $PelangganTable createAlias(String alias) {
    return $PelangganTable(attachedDatabase, alias);
  }
}

class PelangganData extends DataClass implements Insertable<PelangganData> {
  final int id;
  final String nama;
  final int hutang;
  final bool isActive;
  const PelangganData(
      {required this.id,
      required this.nama,
      required this.hutang,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['hutang'] = Variable<int>(hutang);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PelangganCompanion toCompanion(bool nullToAbsent) {
    return PelangganCompanion(
      id: Value(id),
      nama: Value(nama),
      hutang: Value(hutang),
      isActive: Value(isActive),
    );
  }

  factory PelangganData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PelangganData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      hutang: serializer.fromJson<int>(json['hutang']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'hutang': serializer.toJson<int>(hutang),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  PelangganData copyWith(
          {int? id, String? nama, int? hutang, bool? isActive}) =>
      PelangganData(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        hutang: hutang ?? this.hutang,
        isActive: isActive ?? this.isActive,
      );
  PelangganData copyWithCompanion(PelangganCompanion data) {
    return PelangganData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      hutang: data.hutang.present ? data.hutang.value : this.hutang,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PelangganData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('hutang: $hutang, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, hutang, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PelangganData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.hutang == this.hutang &&
          other.isActive == this.isActive);
}

class PelangganCompanion extends UpdateCompanion<PelangganData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<int> hutang;
  final Value<bool> isActive;
  const PelangganCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.hutang = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  PelangganCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.hutang = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : nama = Value(nama);
  static Insertable<PelangganData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<int>? hutang,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (hutang != null) 'hutang': hutang,
      if (isActive != null) 'is_active': isActive,
    });
  }

  PelangganCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama,
      Value<int>? hutang,
      Value<bool>? isActive}) {
    return PelangganCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      hutang: hutang ?? this.hutang,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (hutang.present) {
      map['hutang'] = Variable<int>(hutang.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PelangganCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('hutang: $hutang, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $BarangPelangganTable extends BarangPelanggan
    with TableInfo<$BarangPelangganTable, BarangPelangganData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarangPelangganTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pelangganIdMeta =
      const VerificationMeta('pelangganId');
  @override
  late final GeneratedColumn<int> pelangganId = GeneratedColumn<int>(
      'pelanggan_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pelanggan (id)'));
  static const VerificationMeta _namaBarangMeta =
      const VerificationMeta('namaBarang');
  @override
  late final GeneratedColumn<String> namaBarang = GeneratedColumn<String>(
      'nama_barang', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hargaMeta = const VerificationMeta('harga');
  @override
  late final GeneratedColumn<double> harga = GeneratedColumn<double>(
      'harga', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pelangganId, namaBarang, harga];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barang_pelanggan';
  @override
  VerificationContext validateIntegrity(
      Insertable<BarangPelangganData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pelanggan_id')) {
      context.handle(
          _pelangganIdMeta,
          pelangganId.isAcceptableOrUnknown(
              data['pelanggan_id']!, _pelangganIdMeta));
    } else if (isInserting) {
      context.missing(_pelangganIdMeta);
    }
    if (data.containsKey('nama_barang')) {
      context.handle(
          _namaBarangMeta,
          namaBarang.isAcceptableOrUnknown(
              data['nama_barang']!, _namaBarangMeta));
    } else if (isInserting) {
      context.missing(_namaBarangMeta);
    }
    if (data.containsKey('harga')) {
      context.handle(
          _hargaMeta, harga.isAcceptableOrUnknown(data['harga']!, _hargaMeta));
    } else if (isInserting) {
      context.missing(_hargaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BarangPelangganData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarangPelangganData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pelangganId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pelanggan_id'])!,
      namaBarang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_barang'])!,
      harga: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}harga'])!,
    );
  }

  @override
  $BarangPelangganTable createAlias(String alias) {
    return $BarangPelangganTable(attachedDatabase, alias);
  }
}

class BarangPelangganData extends DataClass
    implements Insertable<BarangPelangganData> {
  final int id;
  final int pelangganId;
  final String namaBarang;
  final double harga;
  const BarangPelangganData(
      {required this.id,
      required this.pelangganId,
      required this.namaBarang,
      required this.harga});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pelanggan_id'] = Variable<int>(pelangganId);
    map['nama_barang'] = Variable<String>(namaBarang);
    map['harga'] = Variable<double>(harga);
    return map;
  }

  BarangPelangganCompanion toCompanion(bool nullToAbsent) {
    return BarangPelangganCompanion(
      id: Value(id),
      pelangganId: Value(pelangganId),
      namaBarang: Value(namaBarang),
      harga: Value(harga),
    );
  }

  factory BarangPelangganData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BarangPelangganData(
      id: serializer.fromJson<int>(json['id']),
      pelangganId: serializer.fromJson<int>(json['pelangganId']),
      namaBarang: serializer.fromJson<String>(json['namaBarang']),
      harga: serializer.fromJson<double>(json['harga']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pelangganId': serializer.toJson<int>(pelangganId),
      'namaBarang': serializer.toJson<String>(namaBarang),
      'harga': serializer.toJson<double>(harga),
    };
  }

  BarangPelangganData copyWith(
          {int? id, int? pelangganId, String? namaBarang, double? harga}) =>
      BarangPelangganData(
        id: id ?? this.id,
        pelangganId: pelangganId ?? this.pelangganId,
        namaBarang: namaBarang ?? this.namaBarang,
        harga: harga ?? this.harga,
      );
  BarangPelangganData copyWithCompanion(BarangPelangganCompanion data) {
    return BarangPelangganData(
      id: data.id.present ? data.id.value : this.id,
      pelangganId:
          data.pelangganId.present ? data.pelangganId.value : this.pelangganId,
      namaBarang:
          data.namaBarang.present ? data.namaBarang.value : this.namaBarang,
      harga: data.harga.present ? data.harga.value : this.harga,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BarangPelangganData(')
          ..write('id: $id, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('namaBarang: $namaBarang, ')
          ..write('harga: $harga')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pelangganId, namaBarang, harga);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BarangPelangganData &&
          other.id == this.id &&
          other.pelangganId == this.pelangganId &&
          other.namaBarang == this.namaBarang &&
          other.harga == this.harga);
}

class BarangPelangganCompanion extends UpdateCompanion<BarangPelangganData> {
  final Value<int> id;
  final Value<int> pelangganId;
  final Value<String> namaBarang;
  final Value<double> harga;
  const BarangPelangganCompanion({
    this.id = const Value.absent(),
    this.pelangganId = const Value.absent(),
    this.namaBarang = const Value.absent(),
    this.harga = const Value.absent(),
  });
  BarangPelangganCompanion.insert({
    this.id = const Value.absent(),
    required int pelangganId,
    required String namaBarang,
    required double harga,
  })  : pelangganId = Value(pelangganId),
        namaBarang = Value(namaBarang),
        harga = Value(harga);
  static Insertable<BarangPelangganData> custom({
    Expression<int>? id,
    Expression<int>? pelangganId,
    Expression<String>? namaBarang,
    Expression<double>? harga,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pelangganId != null) 'pelanggan_id': pelangganId,
      if (namaBarang != null) 'nama_barang': namaBarang,
      if (harga != null) 'harga': harga,
    });
  }

  BarangPelangganCompanion copyWith(
      {Value<int>? id,
      Value<int>? pelangganId,
      Value<String>? namaBarang,
      Value<double>? harga}) {
    return BarangPelangganCompanion(
      id: id ?? this.id,
      pelangganId: pelangganId ?? this.pelangganId,
      namaBarang: namaBarang ?? this.namaBarang,
      harga: harga ?? this.harga,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pelangganId.present) {
      map['pelanggan_id'] = Variable<int>(pelangganId.value);
    }
    if (namaBarang.present) {
      map['nama_barang'] = Variable<String>(namaBarang.value);
    }
    if (harga.present) {
      map['harga'] = Variable<double>(harga.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarangPelangganCompanion(')
          ..write('id: $id, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('namaBarang: $namaBarang, ')
          ..write('harga: $harga')
          ..write(')'))
        .toString();
  }
}

class $HutangTable extends Hutang with TableInfo<$HutangTable, HutangData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HutangTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
      'nama', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pelangganSalesMeta =
      const VerificationMeta('pelangganSales');
  @override
  late final GeneratedColumn<String> pelangganSales = GeneratedColumn<String>(
      'pelanggan_sales', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'));
  static const VerificationMeta _hargaBarangMeta =
      const VerificationMeta('hargaBarang');
  @override
  late final GeneratedColumn<String> hargaBarang = GeneratedColumn<String>(
      'harga_barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jumlahBarangMeta =
      const VerificationMeta('jumlahBarang');
  @override
  late final GeneratedColumn<String> jumlahBarang = GeneratedColumn<String>(
      'jumlah_barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pelangganIdMeta =
      const VerificationMeta('pelangganId');
  @override
  late final GeneratedColumn<int> pelangganId = GeneratedColumn<int>(
      'pelanggan_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jumlahHutangMeta =
      const VerificationMeta('jumlahHutang');
  @override
  late final GeneratedColumn<int> jumlahHutang = GeneratedColumn<int>(
      'jumlah_hutang', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subJumlahHutangMeta =
      const VerificationMeta('subJumlahHutang');
  @override
  late final GeneratedColumn<int> subJumlahHutang = GeneratedColumn<int>(
      'sub_jumlah_hutang', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tanggalHutangMeta =
      const VerificationMeta('tanggalHutang');
  @override
  late final GeneratedColumn<DateTime> tanggalHutang =
      GeneratedColumn<DateTime>('tanggal_hutang', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tanggalJatuhTempoMeta =
      const VerificationMeta('tanggalJatuhTempo');
  @override
  late final GeneratedColumn<DateTime> tanggalJatuhTempo =
      GeneratedColumn<DateTime>('tanggal_jatuh_tempo', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createAtMeta =
      const VerificationMeta('createAt');
  @override
  late final GeneratedColumn<DateTime> createAt = GeneratedColumn<DateTime>(
      'create_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nama,
        pelangganSales,
        isPaid,
        hargaBarang,
        jumlahBarang,
        pelangganId,
        jumlahHutang,
        subJumlahHutang,
        tanggalHutang,
        tanggalJatuhTempo,
        createAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hutang';
  @override
  VerificationContext validateIntegrity(Insertable<HutangData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('pelanggan_sales')) {
      context.handle(
          _pelangganSalesMeta,
          pelangganSales.isAcceptableOrUnknown(
              data['pelanggan_sales']!, _pelangganSalesMeta));
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    } else if (isInserting) {
      context.missing(_isPaidMeta);
    }
    if (data.containsKey('harga_barang')) {
      context.handle(
          _hargaBarangMeta,
          hargaBarang.isAcceptableOrUnknown(
              data['harga_barang']!, _hargaBarangMeta));
    } else if (isInserting) {
      context.missing(_hargaBarangMeta);
    }
    if (data.containsKey('jumlah_barang')) {
      context.handle(
          _jumlahBarangMeta,
          jumlahBarang.isAcceptableOrUnknown(
              data['jumlah_barang']!, _jumlahBarangMeta));
    } else if (isInserting) {
      context.missing(_jumlahBarangMeta);
    }
    if (data.containsKey('pelanggan_id')) {
      context.handle(
          _pelangganIdMeta,
          pelangganId.isAcceptableOrUnknown(
              data['pelanggan_id']!, _pelangganIdMeta));
    } else if (isInserting) {
      context.missing(_pelangganIdMeta);
    }
    if (data.containsKey('jumlah_hutang')) {
      context.handle(
          _jumlahHutangMeta,
          jumlahHutang.isAcceptableOrUnknown(
              data['jumlah_hutang']!, _jumlahHutangMeta));
    } else if (isInserting) {
      context.missing(_jumlahHutangMeta);
    }
    if (data.containsKey('sub_jumlah_hutang')) {
      context.handle(
          _subJumlahHutangMeta,
          subJumlahHutang.isAcceptableOrUnknown(
              data['sub_jumlah_hutang']!, _subJumlahHutangMeta));
    } else if (isInserting) {
      context.missing(_subJumlahHutangMeta);
    }
    if (data.containsKey('tanggal_hutang')) {
      context.handle(
          _tanggalHutangMeta,
          tanggalHutang.isAcceptableOrUnknown(
              data['tanggal_hutang']!, _tanggalHutangMeta));
    } else if (isInserting) {
      context.missing(_tanggalHutangMeta);
    }
    if (data.containsKey('tanggal_jatuh_tempo')) {
      context.handle(
          _tanggalJatuhTempoMeta,
          tanggalJatuhTempo.isAcceptableOrUnknown(
              data['tanggal_jatuh_tempo']!, _tanggalJatuhTempoMeta));
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HutangData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HutangData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      pelangganSales: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pelanggan_sales']),
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      hargaBarang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}harga_barang'])!,
      jumlahBarang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}jumlah_barang'])!,
      pelangganId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pelanggan_id'])!,
      jumlahHutang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jumlah_hutang'])!,
      subJumlahHutang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_jumlah_hutang'])!,
      tanggalHutang: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}tanggal_hutang'])!,
      tanggalJatuhTempo: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}tanggal_jatuh_tempo']),
      createAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_at'])!,
    );
  }

  @override
  $HutangTable createAlias(String alias) {
    return $HutangTable(attachedDatabase, alias);
  }
}

class HutangData extends DataClass implements Insertable<HutangData> {
  final int id;
  final String nama;
  final String? pelangganSales;
  final bool isPaid;
  final String hargaBarang;
  final String jumlahBarang;
  final int pelangganId;
  final int jumlahHutang;
  final int subJumlahHutang;
  final DateTime tanggalHutang;
  final DateTime? tanggalJatuhTempo;
  final DateTime createAt;
  const HutangData(
      {required this.id,
      required this.nama,
      this.pelangganSales,
      required this.isPaid,
      required this.hargaBarang,
      required this.jumlahBarang,
      required this.pelangganId,
      required this.jumlahHutang,
      required this.subJumlahHutang,
      required this.tanggalHutang,
      this.tanggalJatuhTempo,
      required this.createAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || pelangganSales != null) {
      map['pelanggan_sales'] = Variable<String>(pelangganSales);
    }
    map['is_paid'] = Variable<bool>(isPaid);
    map['harga_barang'] = Variable<String>(hargaBarang);
    map['jumlah_barang'] = Variable<String>(jumlahBarang);
    map['pelanggan_id'] = Variable<int>(pelangganId);
    map['jumlah_hutang'] = Variable<int>(jumlahHutang);
    map['sub_jumlah_hutang'] = Variable<int>(subJumlahHutang);
    map['tanggal_hutang'] = Variable<DateTime>(tanggalHutang);
    if (!nullToAbsent || tanggalJatuhTempo != null) {
      map['tanggal_jatuh_tempo'] = Variable<DateTime>(tanggalJatuhTempo);
    }
    map['create_at'] = Variable<DateTime>(createAt);
    return map;
  }

  HutangCompanion toCompanion(bool nullToAbsent) {
    return HutangCompanion(
      id: Value(id),
      nama: Value(nama),
      pelangganSales: pelangganSales == null && nullToAbsent
          ? const Value.absent()
          : Value(pelangganSales),
      isPaid: Value(isPaid),
      hargaBarang: Value(hargaBarang),
      jumlahBarang: Value(jumlahBarang),
      pelangganId: Value(pelangganId),
      jumlahHutang: Value(jumlahHutang),
      subJumlahHutang: Value(subJumlahHutang),
      tanggalHutang: Value(tanggalHutang),
      tanggalJatuhTempo: tanggalJatuhTempo == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalJatuhTempo),
      createAt: Value(createAt),
    );
  }

  factory HutangData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HutangData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      pelangganSales: serializer.fromJson<String?>(json['pelangganSales']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      hargaBarang: serializer.fromJson<String>(json['hargaBarang']),
      jumlahBarang: serializer.fromJson<String>(json['jumlahBarang']),
      pelangganId: serializer.fromJson<int>(json['pelangganId']),
      jumlahHutang: serializer.fromJson<int>(json['jumlahHutang']),
      subJumlahHutang: serializer.fromJson<int>(json['subJumlahHutang']),
      tanggalHutang: serializer.fromJson<DateTime>(json['tanggalHutang']),
      tanggalJatuhTempo:
          serializer.fromJson<DateTime?>(json['tanggalJatuhTempo']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'pelangganSales': serializer.toJson<String?>(pelangganSales),
      'isPaid': serializer.toJson<bool>(isPaid),
      'hargaBarang': serializer.toJson<String>(hargaBarang),
      'jumlahBarang': serializer.toJson<String>(jumlahBarang),
      'pelangganId': serializer.toJson<int>(pelangganId),
      'jumlahHutang': serializer.toJson<int>(jumlahHutang),
      'subJumlahHutang': serializer.toJson<int>(subJumlahHutang),
      'tanggalHutang': serializer.toJson<DateTime>(tanggalHutang),
      'tanggalJatuhTempo': serializer.toJson<DateTime?>(tanggalJatuhTempo),
      'createAt': serializer.toJson<DateTime>(createAt),
    };
  }

  HutangData copyWith(
          {int? id,
          String? nama,
          Value<String?> pelangganSales = const Value.absent(),
          bool? isPaid,
          String? hargaBarang,
          String? jumlahBarang,
          int? pelangganId,
          int? jumlahHutang,
          int? subJumlahHutang,
          DateTime? tanggalHutang,
          Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
          DateTime? createAt}) =>
      HutangData(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        pelangganSales:
            pelangganSales.present ? pelangganSales.value : this.pelangganSales,
        isPaid: isPaid ?? this.isPaid,
        hargaBarang: hargaBarang ?? this.hargaBarang,
        jumlahBarang: jumlahBarang ?? this.jumlahBarang,
        pelangganId: pelangganId ?? this.pelangganId,
        jumlahHutang: jumlahHutang ?? this.jumlahHutang,
        subJumlahHutang: subJumlahHutang ?? this.subJumlahHutang,
        tanggalHutang: tanggalHutang ?? this.tanggalHutang,
        tanggalJatuhTempo: tanggalJatuhTempo.present
            ? tanggalJatuhTempo.value
            : this.tanggalJatuhTempo,
        createAt: createAt ?? this.createAt,
      );
  HutangData copyWithCompanion(HutangCompanion data) {
    return HutangData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      pelangganSales: data.pelangganSales.present
          ? data.pelangganSales.value
          : this.pelangganSales,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      hargaBarang:
          data.hargaBarang.present ? data.hargaBarang.value : this.hargaBarang,
      jumlahBarang: data.jumlahBarang.present
          ? data.jumlahBarang.value
          : this.jumlahBarang,
      pelangganId:
          data.pelangganId.present ? data.pelangganId.value : this.pelangganId,
      jumlahHutang: data.jumlahHutang.present
          ? data.jumlahHutang.value
          : this.jumlahHutang,
      subJumlahHutang: data.subJumlahHutang.present
          ? data.subJumlahHutang.value
          : this.subJumlahHutang,
      tanggalHutang: data.tanggalHutang.present
          ? data.tanggalHutang.value
          : this.tanggalHutang,
      tanggalJatuhTempo: data.tanggalJatuhTempo.present
          ? data.tanggalJatuhTempo.value
          : this.tanggalJatuhTempo,
      createAt: data.createAt.present ? data.createAt.value : this.createAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HutangData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('pelangganSales: $pelangganSales, ')
          ..write('isPaid: $isPaid, ')
          ..write('hargaBarang: $hargaBarang, ')
          ..write('jumlahBarang: $jumlahBarang, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('jumlahHutang: $jumlahHutang, ')
          ..write('subJumlahHutang: $subJumlahHutang, ')
          ..write('tanggalHutang: $tanggalHutang, ')
          ..write('tanggalJatuhTempo: $tanggalJatuhTempo, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      nama,
      pelangganSales,
      isPaid,
      hargaBarang,
      jumlahBarang,
      pelangganId,
      jumlahHutang,
      subJumlahHutang,
      tanggalHutang,
      tanggalJatuhTempo,
      createAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HutangData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.pelangganSales == this.pelangganSales &&
          other.isPaid == this.isPaid &&
          other.hargaBarang == this.hargaBarang &&
          other.jumlahBarang == this.jumlahBarang &&
          other.pelangganId == this.pelangganId &&
          other.jumlahHutang == this.jumlahHutang &&
          other.subJumlahHutang == this.subJumlahHutang &&
          other.tanggalHutang == this.tanggalHutang &&
          other.tanggalJatuhTempo == this.tanggalJatuhTempo &&
          other.createAt == this.createAt);
}

class HutangCompanion extends UpdateCompanion<HutangData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String?> pelangganSales;
  final Value<bool> isPaid;
  final Value<String> hargaBarang;
  final Value<String> jumlahBarang;
  final Value<int> pelangganId;
  final Value<int> jumlahHutang;
  final Value<int> subJumlahHutang;
  final Value<DateTime> tanggalHutang;
  final Value<DateTime?> tanggalJatuhTempo;
  final Value<DateTime> createAt;
  const HutangCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.pelangganSales = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.hargaBarang = const Value.absent(),
    this.jumlahBarang = const Value.absent(),
    this.pelangganId = const Value.absent(),
    this.jumlahHutang = const Value.absent(),
    this.subJumlahHutang = const Value.absent(),
    this.tanggalHutang = const Value.absent(),
    this.tanggalJatuhTempo = const Value.absent(),
    this.createAt = const Value.absent(),
  });
  HutangCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.pelangganSales = const Value.absent(),
    required bool isPaid,
    required String hargaBarang,
    required String jumlahBarang,
    required int pelangganId,
    required int jumlahHutang,
    required int subJumlahHutang,
    required DateTime tanggalHutang,
    this.tanggalJatuhTempo = const Value.absent(),
    this.createAt = const Value.absent(),
  })  : nama = Value(nama),
        isPaid = Value(isPaid),
        hargaBarang = Value(hargaBarang),
        jumlahBarang = Value(jumlahBarang),
        pelangganId = Value(pelangganId),
        jumlahHutang = Value(jumlahHutang),
        subJumlahHutang = Value(subJumlahHutang),
        tanggalHutang = Value(tanggalHutang);
  static Insertable<HutangData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? pelangganSales,
    Expression<bool>? isPaid,
    Expression<String>? hargaBarang,
    Expression<String>? jumlahBarang,
    Expression<int>? pelangganId,
    Expression<int>? jumlahHutang,
    Expression<int>? subJumlahHutang,
    Expression<DateTime>? tanggalHutang,
    Expression<DateTime>? tanggalJatuhTempo,
    Expression<DateTime>? createAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (pelangganSales != null) 'pelanggan_sales': pelangganSales,
      if (isPaid != null) 'is_paid': isPaid,
      if (hargaBarang != null) 'harga_barang': hargaBarang,
      if (jumlahBarang != null) 'jumlah_barang': jumlahBarang,
      if (pelangganId != null) 'pelanggan_id': pelangganId,
      if (jumlahHutang != null) 'jumlah_hutang': jumlahHutang,
      if (subJumlahHutang != null) 'sub_jumlah_hutang': subJumlahHutang,
      if (tanggalHutang != null) 'tanggal_hutang': tanggalHutang,
      if (tanggalJatuhTempo != null) 'tanggal_jatuh_tempo': tanggalJatuhTempo,
      if (createAt != null) 'create_at': createAt,
    });
  }

  HutangCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama,
      Value<String?>? pelangganSales,
      Value<bool>? isPaid,
      Value<String>? hargaBarang,
      Value<String>? jumlahBarang,
      Value<int>? pelangganId,
      Value<int>? jumlahHutang,
      Value<int>? subJumlahHutang,
      Value<DateTime>? tanggalHutang,
      Value<DateTime?>? tanggalJatuhTempo,
      Value<DateTime>? createAt}) {
    return HutangCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      pelangganSales: pelangganSales ?? this.pelangganSales,
      isPaid: isPaid ?? this.isPaid,
      hargaBarang: hargaBarang ?? this.hargaBarang,
      jumlahBarang: jumlahBarang ?? this.jumlahBarang,
      pelangganId: pelangganId ?? this.pelangganId,
      jumlahHutang: jumlahHutang ?? this.jumlahHutang,
      subJumlahHutang: subJumlahHutang ?? this.subJumlahHutang,
      tanggalHutang: tanggalHutang ?? this.tanggalHutang,
      tanggalJatuhTempo: tanggalJatuhTempo ?? this.tanggalJatuhTempo,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (pelangganSales.present) {
      map['pelanggan_sales'] = Variable<String>(pelangganSales.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (hargaBarang.present) {
      map['harga_barang'] = Variable<String>(hargaBarang.value);
    }
    if (jumlahBarang.present) {
      map['jumlah_barang'] = Variable<String>(jumlahBarang.value);
    }
    if (pelangganId.present) {
      map['pelanggan_id'] = Variable<int>(pelangganId.value);
    }
    if (jumlahHutang.present) {
      map['jumlah_hutang'] = Variable<int>(jumlahHutang.value);
    }
    if (subJumlahHutang.present) {
      map['sub_jumlah_hutang'] = Variable<int>(subJumlahHutang.value);
    }
    if (tanggalHutang.present) {
      map['tanggal_hutang'] = Variable<DateTime>(tanggalHutang.value);
    }
    if (tanggalJatuhTempo.present) {
      map['tanggal_jatuh_tempo'] = Variable<DateTime>(tanggalJatuhTempo.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HutangCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('pelangganSales: $pelangganSales, ')
          ..write('isPaid: $isPaid, ')
          ..write('hargaBarang: $hargaBarang, ')
          ..write('jumlahBarang: $jumlahBarang, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('jumlahHutang: $jumlahHutang, ')
          ..write('subJumlahHutang: $subJumlahHutang, ')
          ..write('tanggalHutang: $tanggalHutang, ')
          ..write('tanggalJatuhTempo: $tanggalJatuhTempo, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }
}

class $HutangTokoKMTable extends HutangTokoKM
    with TableInfo<$HutangTokoKMTable, HutangTokoKMData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HutangTokoKMTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namaTokoMeta =
      const VerificationMeta('namaToko');
  @override
  late final GeneratedColumn<String> namaToko = GeneratedColumn<String>(
      'nama_toko', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _jatuhTempoMeta =
      const VerificationMeta('jatuhTempo');
  @override
  late final GeneratedColumn<DateTime> jatuhTempo = GeneratedColumn<DateTime>(
      'jatuh_tempo', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, namaToko, jatuhTempo, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hutang_toko_k_m';
  @override
  VerificationContext validateIntegrity(Insertable<HutangTokoKMData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_toko')) {
      context.handle(_namaTokoMeta,
          namaToko.isAcceptableOrUnknown(data['nama_toko']!, _namaTokoMeta));
    } else if (isInserting) {
      context.missing(_namaTokoMeta);
    }
    if (data.containsKey('jatuh_tempo')) {
      context.handle(
          _jatuhTempoMeta,
          jatuhTempo.isAcceptableOrUnknown(
              data['jatuh_tempo']!, _jatuhTempoMeta));
    } else if (isInserting) {
      context.missing(_jatuhTempoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HutangTokoKMData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HutangTokoKMData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      namaToko: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_toko'])!,
      jatuhTempo: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}jatuh_tempo'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HutangTokoKMTable createAlias(String alias) {
    return $HutangTokoKMTable(attachedDatabase, alias);
  }
}

class HutangTokoKMData extends DataClass
    implements Insertable<HutangTokoKMData> {
  final int id;
  final String namaToko;
  final DateTime jatuhTempo;
  final DateTime createdAt;
  const HutangTokoKMData(
      {required this.id,
      required this.namaToko,
      required this.jatuhTempo,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_toko'] = Variable<String>(namaToko);
    map['jatuh_tempo'] = Variable<DateTime>(jatuhTempo);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HutangTokoKMCompanion toCompanion(bool nullToAbsent) {
    return HutangTokoKMCompanion(
      id: Value(id),
      namaToko: Value(namaToko),
      jatuhTempo: Value(jatuhTempo),
      createdAt: Value(createdAt),
    );
  }

  factory HutangTokoKMData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HutangTokoKMData(
      id: serializer.fromJson<int>(json['id']),
      namaToko: serializer.fromJson<String>(json['namaToko']),
      jatuhTempo: serializer.fromJson<DateTime>(json['jatuhTempo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaToko': serializer.toJson<String>(namaToko),
      'jatuhTempo': serializer.toJson<DateTime>(jatuhTempo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HutangTokoKMData copyWith(
          {int? id,
          String? namaToko,
          DateTime? jatuhTempo,
          DateTime? createdAt}) =>
      HutangTokoKMData(
        id: id ?? this.id,
        namaToko: namaToko ?? this.namaToko,
        jatuhTempo: jatuhTempo ?? this.jatuhTempo,
        createdAt: createdAt ?? this.createdAt,
      );
  HutangTokoKMData copyWithCompanion(HutangTokoKMCompanion data) {
    return HutangTokoKMData(
      id: data.id.present ? data.id.value : this.id,
      namaToko: data.namaToko.present ? data.namaToko.value : this.namaToko,
      jatuhTempo:
          data.jatuhTempo.present ? data.jatuhTempo.value : this.jatuhTempo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HutangTokoKMData(')
          ..write('id: $id, ')
          ..write('namaToko: $namaToko, ')
          ..write('jatuhTempo: $jatuhTempo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaToko, jatuhTempo, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HutangTokoKMData &&
          other.id == this.id &&
          other.namaToko == this.namaToko &&
          other.jatuhTempo == this.jatuhTempo &&
          other.createdAt == this.createdAt);
}

class HutangTokoKMCompanion extends UpdateCompanion<HutangTokoKMData> {
  final Value<int> id;
  final Value<String> namaToko;
  final Value<DateTime> jatuhTempo;
  final Value<DateTime> createdAt;
  const HutangTokoKMCompanion({
    this.id = const Value.absent(),
    this.namaToko = const Value.absent(),
    this.jatuhTempo = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HutangTokoKMCompanion.insert({
    this.id = const Value.absent(),
    required String namaToko,
    required DateTime jatuhTempo,
    required DateTime createdAt,
  })  : namaToko = Value(namaToko),
        jatuhTempo = Value(jatuhTempo),
        createdAt = Value(createdAt);
  static Insertable<HutangTokoKMData> custom({
    Expression<int>? id,
    Expression<String>? namaToko,
    Expression<DateTime>? jatuhTempo,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaToko != null) 'nama_toko': namaToko,
      if (jatuhTempo != null) 'jatuh_tempo': jatuhTempo,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HutangTokoKMCompanion copyWith(
      {Value<int>? id,
      Value<String>? namaToko,
      Value<DateTime>? jatuhTempo,
      Value<DateTime>? createdAt}) {
    return HutangTokoKMCompanion(
      id: id ?? this.id,
      namaToko: namaToko ?? this.namaToko,
      jatuhTempo: jatuhTempo ?? this.jatuhTempo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaToko.present) {
      map['nama_toko'] = Variable<String>(namaToko.value);
    }
    if (jatuhTempo.present) {
      map['jatuh_tempo'] = Variable<DateTime>(jatuhTempo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HutangTokoKMCompanion(')
          ..write('id: $id, ')
          ..write('namaToko: $namaToko, ')
          ..write('jatuhTempo: $jatuhTempo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SubHutangTable extends SubHutang
    with TableInfo<$SubHutangTable, SubHutangData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubHutangTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hutangIdMeta =
      const VerificationMeta('hutangId');
  @override
  late final GeneratedColumn<int> hutangId = GeneratedColumn<int>(
      'hutang_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bayarCicilanMeta =
      const VerificationMeta('bayarCicilan');
  @override
  late final GeneratedColumn<int> bayarCicilan = GeneratedColumn<int>(
      'bayar_cicilan', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createAtMeta =
      const VerificationMeta('createAt');
  @override
  late final GeneratedColumn<DateTime> createAt = GeneratedColumn<DateTime>(
      'create_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, hutangId, bayarCicilan, createAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_hutang';
  @override
  VerificationContext validateIntegrity(Insertable<SubHutangData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hutang_id')) {
      context.handle(_hutangIdMeta,
          hutangId.isAcceptableOrUnknown(data['hutang_id']!, _hutangIdMeta));
    } else if (isInserting) {
      context.missing(_hutangIdMeta);
    }
    if (data.containsKey('bayar_cicilan')) {
      context.handle(
          _bayarCicilanMeta,
          bayarCicilan.isAcceptableOrUnknown(
              data['bayar_cicilan']!, _bayarCicilanMeta));
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubHutangData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubHutangData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hutangId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hutang_id'])!,
      bayarCicilan: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bayar_cicilan']),
      createAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_at'])!,
    );
  }

  @override
  $SubHutangTable createAlias(String alias) {
    return $SubHutangTable(attachedDatabase, alias);
  }
}

class SubHutangData extends DataClass implements Insertable<SubHutangData> {
  final int id;
  final int hutangId;
  final int? bayarCicilan;
  final DateTime createAt;
  const SubHutangData(
      {required this.id,
      required this.hutangId,
      this.bayarCicilan,
      required this.createAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hutang_id'] = Variable<int>(hutangId);
    if (!nullToAbsent || bayarCicilan != null) {
      map['bayar_cicilan'] = Variable<int>(bayarCicilan);
    }
    map['create_at'] = Variable<DateTime>(createAt);
    return map;
  }

  SubHutangCompanion toCompanion(bool nullToAbsent) {
    return SubHutangCompanion(
      id: Value(id),
      hutangId: Value(hutangId),
      bayarCicilan: bayarCicilan == null && nullToAbsent
          ? const Value.absent()
          : Value(bayarCicilan),
      createAt: Value(createAt),
    );
  }

  factory SubHutangData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubHutangData(
      id: serializer.fromJson<int>(json['id']),
      hutangId: serializer.fromJson<int>(json['hutangId']),
      bayarCicilan: serializer.fromJson<int?>(json['bayarCicilan']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hutangId': serializer.toJson<int>(hutangId),
      'bayarCicilan': serializer.toJson<int?>(bayarCicilan),
      'createAt': serializer.toJson<DateTime>(createAt),
    };
  }

  SubHutangData copyWith(
          {int? id,
          int? hutangId,
          Value<int?> bayarCicilan = const Value.absent(),
          DateTime? createAt}) =>
      SubHutangData(
        id: id ?? this.id,
        hutangId: hutangId ?? this.hutangId,
        bayarCicilan:
            bayarCicilan.present ? bayarCicilan.value : this.bayarCicilan,
        createAt: createAt ?? this.createAt,
      );
  SubHutangData copyWithCompanion(SubHutangCompanion data) {
    return SubHutangData(
      id: data.id.present ? data.id.value : this.id,
      hutangId: data.hutangId.present ? data.hutangId.value : this.hutangId,
      bayarCicilan: data.bayarCicilan.present
          ? data.bayarCicilan.value
          : this.bayarCicilan,
      createAt: data.createAt.present ? data.createAt.value : this.createAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubHutangData(')
          ..write('id: $id, ')
          ..write('hutangId: $hutangId, ')
          ..write('bayarCicilan: $bayarCicilan, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hutangId, bayarCicilan, createAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubHutangData &&
          other.id == this.id &&
          other.hutangId == this.hutangId &&
          other.bayarCicilan == this.bayarCicilan &&
          other.createAt == this.createAt);
}

class SubHutangCompanion extends UpdateCompanion<SubHutangData> {
  final Value<int> id;
  final Value<int> hutangId;
  final Value<int?> bayarCicilan;
  final Value<DateTime> createAt;
  const SubHutangCompanion({
    this.id = const Value.absent(),
    this.hutangId = const Value.absent(),
    this.bayarCicilan = const Value.absent(),
    this.createAt = const Value.absent(),
  });
  SubHutangCompanion.insert({
    this.id = const Value.absent(),
    required int hutangId,
    this.bayarCicilan = const Value.absent(),
    this.createAt = const Value.absent(),
  }) : hutangId = Value(hutangId);
  static Insertable<SubHutangData> custom({
    Expression<int>? id,
    Expression<int>? hutangId,
    Expression<int>? bayarCicilan,
    Expression<DateTime>? createAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hutangId != null) 'hutang_id': hutangId,
      if (bayarCicilan != null) 'bayar_cicilan': bayarCicilan,
      if (createAt != null) 'create_at': createAt,
    });
  }

  SubHutangCompanion copyWith(
      {Value<int>? id,
      Value<int>? hutangId,
      Value<int?>? bayarCicilan,
      Value<DateTime>? createAt}) {
    return SubHutangCompanion(
      id: id ?? this.id,
      hutangId: hutangId ?? this.hutangId,
      bayarCicilan: bayarCicilan ?? this.bayarCicilan,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hutangId.present) {
      map['hutang_id'] = Variable<int>(hutangId.value);
    }
    if (bayarCicilan.present) {
      map['bayar_cicilan'] = Variable<int>(bayarCicilan.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubHutangCompanion(')
          ..write('id: $id, ')
          ..write('hutangId: $hutangId, ')
          ..write('bayarCicilan: $bayarCicilan, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BarangTable barang = $BarangTable(this);
  late final $TransaksiTable transaksi = $TransaksiTable(this);
  late final $PelangganTable pelanggan = $PelangganTable(this);
  late final $BarangPelangganTable barangPelanggan =
      $BarangPelangganTable(this);
  late final $HutangTable hutang = $HutangTable(this);
  late final $HutangTokoKMTable hutangTokoKM = $HutangTokoKMTable(this);
  late final $SubHutangTable subHutang = $SubHutangTable(this);
  late final PelangganDao pelangganDao = PelangganDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        barang,
        transaksi,
        pelanggan,
        barangPelanggan,
        hutang,
        hutangTokoKM,
        subHutang
      ];
}

typedef $$BarangTableCreateCompanionBuilder = BarangCompanion Function({
  Value<int> id,
  required String name,
  required String kode,
  required int modal,
  required int harga_jual,
  required int stock,
  required int type,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$BarangTableUpdateCompanionBuilder = BarangCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> kode,
  Value<int> modal,
  Value<int> harga_jual,
  Value<int> stock,
  Value<int> type,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$BarangTableFilterComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kode => $composableBuilder(
      column: $table.kode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get modal => $composableBuilder(
      column: $table.modal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get harga_jual => $composableBuilder(
      column: $table.harga_jual, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BarangTableOrderingComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kode => $composableBuilder(
      column: $table.kode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get modal => $composableBuilder(
      column: $table.modal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get harga_jual => $composableBuilder(
      column: $table.harga_jual, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BarangTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kode =>
      $composableBuilder(column: $table.kode, builder: (column) => column);

  GeneratedColumn<int> get modal =>
      $composableBuilder(column: $table.modal, builder: (column) => column);

  GeneratedColumn<int> get harga_jual => $composableBuilder(
      column: $table.harga_jual, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BarangTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarangTable,
    BarangData,
    $$BarangTableFilterComposer,
    $$BarangTableOrderingComposer,
    $$BarangTableAnnotationComposer,
    $$BarangTableCreateCompanionBuilder,
    $$BarangTableUpdateCompanionBuilder,
    (BarangData, BaseReferences<_$AppDatabase, $BarangTable, BarangData>),
    BarangData,
    PrefetchHooks Function()> {
  $$BarangTableTableManager(_$AppDatabase db, $BarangTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarangTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarangTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarangTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> kode = const Value.absent(),
            Value<int> modal = const Value.absent(),
            Value<int> harga_jual = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BarangCompanion(
            id: id,
            name: name,
            kode: kode,
            modal: modal,
            harga_jual: harga_jual,
            stock: stock,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String kode,
            required int modal,
            required int harga_jual,
            required int stock,
            required int type,
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              BarangCompanion.insert(
            id: id,
            name: name,
            kode: kode,
            modal: modal,
            harga_jual: harga_jual,
            stock: stock,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BarangTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BarangTable,
    BarangData,
    $$BarangTableFilterComposer,
    $$BarangTableOrderingComposer,
    $$BarangTableAnnotationComposer,
    $$BarangTableCreateCompanionBuilder,
    $$BarangTableUpdateCompanionBuilder,
    (BarangData, BaseReferences<_$AppDatabase, $BarangTable, BarangData>),
    BarangData,
    PrefetchHooks Function()>;
typedef $$TransaksiTableCreateCompanionBuilder = TransaksiCompanion Function({
  Value<int> id,
  Value<int?> transactionHutangId,
  required String barang,
  required String hargaBarang,
  required String jumlahBarang,
  required int subTotalHarga,
  required int totalHarga,
  required bool isPaid,
  Value<DateTime?> dueDate,
  Value<String?> customerName,
  Value<DateTime> createdAt,
});
typedef $$TransaksiTableUpdateCompanionBuilder = TransaksiCompanion Function({
  Value<int> id,
  Value<int?> transactionHutangId,
  Value<String> barang,
  Value<String> hargaBarang,
  Value<String> jumlahBarang,
  Value<int> subTotalHarga,
  Value<int> totalHarga,
  Value<bool> isPaid,
  Value<DateTime?> dueDate,
  Value<String?> customerName,
  Value<DateTime> createdAt,
});

class $$TransaksiTableFilterComposer
    extends Composer<_$AppDatabase, $TransaksiTable> {
  $$TransaksiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get transactionHutangId => $composableBuilder(
      column: $table.transactionHutangId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barang => $composableBuilder(
      column: $table.barang, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subTotalHarga => $composableBuilder(
      column: $table.subTotalHarga, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalHarga => $composableBuilder(
      column: $table.totalHarga, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TransaksiTableOrderingComposer
    extends Composer<_$AppDatabase, $TransaksiTable> {
  $$TransaksiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get transactionHutangId => $composableBuilder(
      column: $table.transactionHutangId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barang => $composableBuilder(
      column: $table.barang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subTotalHarga => $composableBuilder(
      column: $table.subTotalHarga,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalHarga => $composableBuilder(
      column: $table.totalHarga, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TransaksiTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransaksiTable> {
  $$TransaksiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transactionHutangId => $composableBuilder(
      column: $table.transactionHutangId, builder: (column) => column);

  GeneratedColumn<String> get barang =>
      $composableBuilder(column: $table.barang, builder: (column) => column);

  GeneratedColumn<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => column);

  GeneratedColumn<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang, builder: (column) => column);

  GeneratedColumn<int> get subTotalHarga => $composableBuilder(
      column: $table.subTotalHarga, builder: (column) => column);

  GeneratedColumn<int> get totalHarga => $composableBuilder(
      column: $table.totalHarga, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransaksiTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransaksiTable,
    TransaksiData,
    $$TransaksiTableFilterComposer,
    $$TransaksiTableOrderingComposer,
    $$TransaksiTableAnnotationComposer,
    $$TransaksiTableCreateCompanionBuilder,
    $$TransaksiTableUpdateCompanionBuilder,
    (
      TransaksiData,
      BaseReferences<_$AppDatabase, $TransaksiTable, TransaksiData>
    ),
    TransaksiData,
    PrefetchHooks Function()> {
  $$TransaksiTableTableManager(_$AppDatabase db, $TransaksiTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransaksiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransaksiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransaksiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionHutangId = const Value.absent(),
            Value<String> barang = const Value.absent(),
            Value<String> hargaBarang = const Value.absent(),
            Value<String> jumlahBarang = const Value.absent(),
            Value<int> subTotalHarga = const Value.absent(),
            Value<int> totalHarga = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> customerName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TransaksiCompanion(
            id: id,
            transactionHutangId: transactionHutangId,
            barang: barang,
            hargaBarang: hargaBarang,
            jumlahBarang: jumlahBarang,
            subTotalHarga: subTotalHarga,
            totalHarga: totalHarga,
            isPaid: isPaid,
            dueDate: dueDate,
            customerName: customerName,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionHutangId = const Value.absent(),
            required String barang,
            required String hargaBarang,
            required String jumlahBarang,
            required int subTotalHarga,
            required int totalHarga,
            required bool isPaid,
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> customerName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TransaksiCompanion.insert(
            id: id,
            transactionHutangId: transactionHutangId,
            barang: barang,
            hargaBarang: hargaBarang,
            jumlahBarang: jumlahBarang,
            subTotalHarga: subTotalHarga,
            totalHarga: totalHarga,
            isPaid: isPaid,
            dueDate: dueDate,
            customerName: customerName,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransaksiTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransaksiTable,
    TransaksiData,
    $$TransaksiTableFilterComposer,
    $$TransaksiTableOrderingComposer,
    $$TransaksiTableAnnotationComposer,
    $$TransaksiTableCreateCompanionBuilder,
    $$TransaksiTableUpdateCompanionBuilder,
    (
      TransaksiData,
      BaseReferences<_$AppDatabase, $TransaksiTable, TransaksiData>
    ),
    TransaksiData,
    PrefetchHooks Function()>;
typedef $$PelangganTableCreateCompanionBuilder = PelangganCompanion Function({
  Value<int> id,
  required String nama,
  Value<int> hutang,
  Value<bool> isActive,
});
typedef $$PelangganTableUpdateCompanionBuilder = PelangganCompanion Function({
  Value<int> id,
  Value<String> nama,
  Value<int> hutang,
  Value<bool> isActive,
});

final class $$PelangganTableReferences
    extends BaseReferences<_$AppDatabase, $PelangganTable, PelangganData> {
  $$PelangganTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BarangPelangganTable, List<BarangPelangganData>>
      _barangPelangganRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.barangPelanggan,
              aliasName: $_aliasNameGenerator(
                  db.pelanggan.id, db.barangPelanggan.pelangganId));

  $$BarangPelangganTableProcessedTableManager get barangPelangganRefs {
    final manager =
        $$BarangPelangganTableTableManager($_db, $_db.barangPelanggan)
            .filter((f) => f.pelangganId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_barangPelangganRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PelangganTableFilterComposer
    extends Composer<_$AppDatabase, $PelangganTable> {
  $$PelangganTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hutang => $composableBuilder(
      column: $table.hutang, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> barangPelangganRefs(
      Expression<bool> Function($$BarangPelangganTableFilterComposer f) f) {
    final $$BarangPelangganTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.barangPelanggan,
        getReferencedColumn: (t) => t.pelangganId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BarangPelangganTableFilterComposer(
              $db: $db,
              $table: $db.barangPelanggan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PelangganTableOrderingComposer
    extends Composer<_$AppDatabase, $PelangganTable> {
  $$PelangganTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hutang => $composableBuilder(
      column: $table.hutang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$PelangganTableAnnotationComposer
    extends Composer<_$AppDatabase, $PelangganTable> {
  $$PelangganTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<int> get hutang =>
      $composableBuilder(column: $table.hutang, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> barangPelangganRefs<T extends Object>(
      Expression<T> Function($$BarangPelangganTableAnnotationComposer a) f) {
    final $$BarangPelangganTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.barangPelanggan,
        getReferencedColumn: (t) => t.pelangganId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BarangPelangganTableAnnotationComposer(
              $db: $db,
              $table: $db.barangPelanggan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PelangganTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PelangganTable,
    PelangganData,
    $$PelangganTableFilterComposer,
    $$PelangganTableOrderingComposer,
    $$PelangganTableAnnotationComposer,
    $$PelangganTableCreateCompanionBuilder,
    $$PelangganTableUpdateCompanionBuilder,
    (PelangganData, $$PelangganTableReferences),
    PelangganData,
    PrefetchHooks Function({bool barangPelangganRefs})> {
  $$PelangganTableTableManager(_$AppDatabase db, $PelangganTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PelangganTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PelangganTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PelangganTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nama = const Value.absent(),
            Value<int> hutang = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              PelangganCompanion(
            id: id,
            nama: nama,
            hutang: hutang,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nama,
            Value<int> hutang = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              PelangganCompanion.insert(
            id: id,
            nama: nama,
            hutang: hutang,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PelangganTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({barangPelangganRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (barangPelangganRefs) db.barangPelanggan
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (barangPelangganRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PelangganTableReferences
                            ._barangPelangganRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PelangganTableReferences(db, table, p0)
                                .barangPelangganRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.pelangganId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PelangganTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PelangganTable,
    PelangganData,
    $$PelangganTableFilterComposer,
    $$PelangganTableOrderingComposer,
    $$PelangganTableAnnotationComposer,
    $$PelangganTableCreateCompanionBuilder,
    $$PelangganTableUpdateCompanionBuilder,
    (PelangganData, $$PelangganTableReferences),
    PelangganData,
    PrefetchHooks Function({bool barangPelangganRefs})>;
typedef $$BarangPelangganTableCreateCompanionBuilder = BarangPelangganCompanion
    Function({
  Value<int> id,
  required int pelangganId,
  required String namaBarang,
  required double harga,
});
typedef $$BarangPelangganTableUpdateCompanionBuilder = BarangPelangganCompanion
    Function({
  Value<int> id,
  Value<int> pelangganId,
  Value<String> namaBarang,
  Value<double> harga,
});

final class $$BarangPelangganTableReferences extends BaseReferences<
    _$AppDatabase, $BarangPelangganTable, BarangPelangganData> {
  $$BarangPelangganTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PelangganTable _pelangganIdTable(_$AppDatabase db) =>
      db.pelanggan.createAlias($_aliasNameGenerator(
          db.barangPelanggan.pelangganId, db.pelanggan.id));

  $$PelangganTableProcessedTableManager get pelangganId {
    final manager = $$PelangganTableTableManager($_db, $_db.pelanggan)
        .filter((f) => f.id($_item.pelangganId!));
    final item = $_typedResult.readTableOrNull(_pelangganIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BarangPelangganTableFilterComposer
    extends Composer<_$AppDatabase, $BarangPelangganTable> {
  $$BarangPelangganTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get namaBarang => $composableBuilder(
      column: $table.namaBarang, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get harga => $composableBuilder(
      column: $table.harga, builder: (column) => ColumnFilters(column));

  $$PelangganTableFilterComposer get pelangganId {
    final $$PelangganTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pelangganId,
        referencedTable: $db.pelanggan,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PelangganTableFilterComposer(
              $db: $db,
              $table: $db.pelanggan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BarangPelangganTableOrderingComposer
    extends Composer<_$AppDatabase, $BarangPelangganTable> {
  $$BarangPelangganTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get namaBarang => $composableBuilder(
      column: $table.namaBarang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get harga => $composableBuilder(
      column: $table.harga, builder: (column) => ColumnOrderings(column));

  $$PelangganTableOrderingComposer get pelangganId {
    final $$PelangganTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pelangganId,
        referencedTable: $db.pelanggan,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PelangganTableOrderingComposer(
              $db: $db,
              $table: $db.pelanggan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BarangPelangganTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarangPelangganTable> {
  $$BarangPelangganTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaBarang => $composableBuilder(
      column: $table.namaBarang, builder: (column) => column);

  GeneratedColumn<double> get harga =>
      $composableBuilder(column: $table.harga, builder: (column) => column);

  $$PelangganTableAnnotationComposer get pelangganId {
    final $$PelangganTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pelangganId,
        referencedTable: $db.pelanggan,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PelangganTableAnnotationComposer(
              $db: $db,
              $table: $db.pelanggan,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BarangPelangganTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarangPelangganTable,
    BarangPelangganData,
    $$BarangPelangganTableFilterComposer,
    $$BarangPelangganTableOrderingComposer,
    $$BarangPelangganTableAnnotationComposer,
    $$BarangPelangganTableCreateCompanionBuilder,
    $$BarangPelangganTableUpdateCompanionBuilder,
    (BarangPelangganData, $$BarangPelangganTableReferences),
    BarangPelangganData,
    PrefetchHooks Function({bool pelangganId})> {
  $$BarangPelangganTableTableManager(
      _$AppDatabase db, $BarangPelangganTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarangPelangganTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarangPelangganTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarangPelangganTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> pelangganId = const Value.absent(),
            Value<String> namaBarang = const Value.absent(),
            Value<double> harga = const Value.absent(),
          }) =>
              BarangPelangganCompanion(
            id: id,
            pelangganId: pelangganId,
            namaBarang: namaBarang,
            harga: harga,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int pelangganId,
            required String namaBarang,
            required double harga,
          }) =>
              BarangPelangganCompanion.insert(
            id: id,
            pelangganId: pelangganId,
            namaBarang: namaBarang,
            harga: harga,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BarangPelangganTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pelangganId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (pelangganId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pelangganId,
                    referencedTable:
                        $$BarangPelangganTableReferences._pelangganIdTable(db),
                    referencedColumn: $$BarangPelangganTableReferences
                        ._pelangganIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BarangPelangganTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BarangPelangganTable,
    BarangPelangganData,
    $$BarangPelangganTableFilterComposer,
    $$BarangPelangganTableOrderingComposer,
    $$BarangPelangganTableAnnotationComposer,
    $$BarangPelangganTableCreateCompanionBuilder,
    $$BarangPelangganTableUpdateCompanionBuilder,
    (BarangPelangganData, $$BarangPelangganTableReferences),
    BarangPelangganData,
    PrefetchHooks Function({bool pelangganId})>;
typedef $$HutangTableCreateCompanionBuilder = HutangCompanion Function({
  Value<int> id,
  required String nama,
  Value<String?> pelangganSales,
  required bool isPaid,
  required String hargaBarang,
  required String jumlahBarang,
  required int pelangganId,
  required int jumlahHutang,
  required int subJumlahHutang,
  required DateTime tanggalHutang,
  Value<DateTime?> tanggalJatuhTempo,
  Value<DateTime> createAt,
});
typedef $$HutangTableUpdateCompanionBuilder = HutangCompanion Function({
  Value<int> id,
  Value<String> nama,
  Value<String?> pelangganSales,
  Value<bool> isPaid,
  Value<String> hargaBarang,
  Value<String> jumlahBarang,
  Value<int> pelangganId,
  Value<int> jumlahHutang,
  Value<int> subJumlahHutang,
  Value<DateTime> tanggalHutang,
  Value<DateTime?> tanggalJatuhTempo,
  Value<DateTime> createAt,
});

class $$HutangTableFilterComposer
    extends Composer<_$AppDatabase, $HutangTable> {
  $$HutangTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pelangganSales => $composableBuilder(
      column: $table.pelangganSales,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pelangganId => $composableBuilder(
      column: $table.pelangganId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get jumlahHutang => $composableBuilder(
      column: $table.jumlahHutang, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subJumlahHutang => $composableBuilder(
      column: $table.subJumlahHutang,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get tanggalHutang => $composableBuilder(
      column: $table.tanggalHutang, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get tanggalJatuhTempo => $composableBuilder(
      column: $table.tanggalJatuhTempo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnFilters(column));
}

class $$HutangTableOrderingComposer
    extends Composer<_$AppDatabase, $HutangTable> {
  $$HutangTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pelangganSales => $composableBuilder(
      column: $table.pelangganSales,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pelangganId => $composableBuilder(
      column: $table.pelangganId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get jumlahHutang => $composableBuilder(
      column: $table.jumlahHutang,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subJumlahHutang => $composableBuilder(
      column: $table.subJumlahHutang,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get tanggalHutang => $composableBuilder(
      column: $table.tanggalHutang,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get tanggalJatuhTempo => $composableBuilder(
      column: $table.tanggalJatuhTempo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnOrderings(column));
}

class $$HutangTableAnnotationComposer
    extends Composer<_$AppDatabase, $HutangTable> {
  $$HutangTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get pelangganSales => $composableBuilder(
      column: $table.pelangganSales, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<String> get hargaBarang => $composableBuilder(
      column: $table.hargaBarang, builder: (column) => column);

  GeneratedColumn<String> get jumlahBarang => $composableBuilder(
      column: $table.jumlahBarang, builder: (column) => column);

  GeneratedColumn<int> get pelangganId => $composableBuilder(
      column: $table.pelangganId, builder: (column) => column);

  GeneratedColumn<int> get jumlahHutang => $composableBuilder(
      column: $table.jumlahHutang, builder: (column) => column);

  GeneratedColumn<int> get subJumlahHutang => $composableBuilder(
      column: $table.subJumlahHutang, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalHutang => $composableBuilder(
      column: $table.tanggalHutang, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalJatuhTempo => $composableBuilder(
      column: $table.tanggalJatuhTempo, builder: (column) => column);

  GeneratedColumn<DateTime> get createAt =>
      $composableBuilder(column: $table.createAt, builder: (column) => column);
}

class $$HutangTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HutangTable,
    HutangData,
    $$HutangTableFilterComposer,
    $$HutangTableOrderingComposer,
    $$HutangTableAnnotationComposer,
    $$HutangTableCreateCompanionBuilder,
    $$HutangTableUpdateCompanionBuilder,
    (HutangData, BaseReferences<_$AppDatabase, $HutangTable, HutangData>),
    HutangData,
    PrefetchHooks Function()> {
  $$HutangTableTableManager(_$AppDatabase db, $HutangTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HutangTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HutangTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HutangTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nama = const Value.absent(),
            Value<String?> pelangganSales = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<String> hargaBarang = const Value.absent(),
            Value<String> jumlahBarang = const Value.absent(),
            Value<int> pelangganId = const Value.absent(),
            Value<int> jumlahHutang = const Value.absent(),
            Value<int> subJumlahHutang = const Value.absent(),
            Value<DateTime> tanggalHutang = const Value.absent(),
            Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
            Value<DateTime> createAt = const Value.absent(),
          }) =>
              HutangCompanion(
            id: id,
            nama: nama,
            pelangganSales: pelangganSales,
            isPaid: isPaid,
            hargaBarang: hargaBarang,
            jumlahBarang: jumlahBarang,
            pelangganId: pelangganId,
            jumlahHutang: jumlahHutang,
            subJumlahHutang: subJumlahHutang,
            tanggalHutang: tanggalHutang,
            tanggalJatuhTempo: tanggalJatuhTempo,
            createAt: createAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nama,
            Value<String?> pelangganSales = const Value.absent(),
            required bool isPaid,
            required String hargaBarang,
            required String jumlahBarang,
            required int pelangganId,
            required int jumlahHutang,
            required int subJumlahHutang,
            required DateTime tanggalHutang,
            Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
            Value<DateTime> createAt = const Value.absent(),
          }) =>
              HutangCompanion.insert(
            id: id,
            nama: nama,
            pelangganSales: pelangganSales,
            isPaid: isPaid,
            hargaBarang: hargaBarang,
            jumlahBarang: jumlahBarang,
            pelangganId: pelangganId,
            jumlahHutang: jumlahHutang,
            subJumlahHutang: subJumlahHutang,
            tanggalHutang: tanggalHutang,
            tanggalJatuhTempo: tanggalJatuhTempo,
            createAt: createAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HutangTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HutangTable,
    HutangData,
    $$HutangTableFilterComposer,
    $$HutangTableOrderingComposer,
    $$HutangTableAnnotationComposer,
    $$HutangTableCreateCompanionBuilder,
    $$HutangTableUpdateCompanionBuilder,
    (HutangData, BaseReferences<_$AppDatabase, $HutangTable, HutangData>),
    HutangData,
    PrefetchHooks Function()>;
typedef $$HutangTokoKMTableCreateCompanionBuilder = HutangTokoKMCompanion
    Function({
  Value<int> id,
  required String namaToko,
  required DateTime jatuhTempo,
  required DateTime createdAt,
});
typedef $$HutangTokoKMTableUpdateCompanionBuilder = HutangTokoKMCompanion
    Function({
  Value<int> id,
  Value<String> namaToko,
  Value<DateTime> jatuhTempo,
  Value<DateTime> createdAt,
});

class $$HutangTokoKMTableFilterComposer
    extends Composer<_$AppDatabase, $HutangTokoKMTable> {
  $$HutangTokoKMTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get namaToko => $composableBuilder(
      column: $table.namaToko, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get jatuhTempo => $composableBuilder(
      column: $table.jatuhTempo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$HutangTokoKMTableOrderingComposer
    extends Composer<_$AppDatabase, $HutangTokoKMTable> {
  $$HutangTokoKMTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get namaToko => $composableBuilder(
      column: $table.namaToko, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get jatuhTempo => $composableBuilder(
      column: $table.jatuhTempo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HutangTokoKMTableAnnotationComposer
    extends Composer<_$AppDatabase, $HutangTokoKMTable> {
  $$HutangTokoKMTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaToko =>
      $composableBuilder(column: $table.namaToko, builder: (column) => column);

  GeneratedColumn<DateTime> get jatuhTempo => $composableBuilder(
      column: $table.jatuhTempo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HutangTokoKMTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HutangTokoKMTable,
    HutangTokoKMData,
    $$HutangTokoKMTableFilterComposer,
    $$HutangTokoKMTableOrderingComposer,
    $$HutangTokoKMTableAnnotationComposer,
    $$HutangTokoKMTableCreateCompanionBuilder,
    $$HutangTokoKMTableUpdateCompanionBuilder,
    (
      HutangTokoKMData,
      BaseReferences<_$AppDatabase, $HutangTokoKMTable, HutangTokoKMData>
    ),
    HutangTokoKMData,
    PrefetchHooks Function()> {
  $$HutangTokoKMTableTableManager(_$AppDatabase db, $HutangTokoKMTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HutangTokoKMTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HutangTokoKMTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HutangTokoKMTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> namaToko = const Value.absent(),
            Value<DateTime> jatuhTempo = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              HutangTokoKMCompanion(
            id: id,
            namaToko: namaToko,
            jatuhTempo: jatuhTempo,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String namaToko,
            required DateTime jatuhTempo,
            required DateTime createdAt,
          }) =>
              HutangTokoKMCompanion.insert(
            id: id,
            namaToko: namaToko,
            jatuhTempo: jatuhTempo,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HutangTokoKMTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HutangTokoKMTable,
    HutangTokoKMData,
    $$HutangTokoKMTableFilterComposer,
    $$HutangTokoKMTableOrderingComposer,
    $$HutangTokoKMTableAnnotationComposer,
    $$HutangTokoKMTableCreateCompanionBuilder,
    $$HutangTokoKMTableUpdateCompanionBuilder,
    (
      HutangTokoKMData,
      BaseReferences<_$AppDatabase, $HutangTokoKMTable, HutangTokoKMData>
    ),
    HutangTokoKMData,
    PrefetchHooks Function()>;
typedef $$SubHutangTableCreateCompanionBuilder = SubHutangCompanion Function({
  Value<int> id,
  required int hutangId,
  Value<int?> bayarCicilan,
  Value<DateTime> createAt,
});
typedef $$SubHutangTableUpdateCompanionBuilder = SubHutangCompanion Function({
  Value<int> id,
  Value<int> hutangId,
  Value<int?> bayarCicilan,
  Value<DateTime> createAt,
});

class $$SubHutangTableFilterComposer
    extends Composer<_$AppDatabase, $SubHutangTable> {
  $$SubHutangTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hutangId => $composableBuilder(
      column: $table.hutangId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bayarCicilan => $composableBuilder(
      column: $table.bayarCicilan, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnFilters(column));
}

class $$SubHutangTableOrderingComposer
    extends Composer<_$AppDatabase, $SubHutangTable> {
  $$SubHutangTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hutangId => $composableBuilder(
      column: $table.hutangId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bayarCicilan => $composableBuilder(
      column: $table.bayarCicilan,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnOrderings(column));
}

class $$SubHutangTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubHutangTable> {
  $$SubHutangTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get hutangId =>
      $composableBuilder(column: $table.hutangId, builder: (column) => column);

  GeneratedColumn<int> get bayarCicilan => $composableBuilder(
      column: $table.bayarCicilan, builder: (column) => column);

  GeneratedColumn<DateTime> get createAt =>
      $composableBuilder(column: $table.createAt, builder: (column) => column);
}

class $$SubHutangTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubHutangTable,
    SubHutangData,
    $$SubHutangTableFilterComposer,
    $$SubHutangTableOrderingComposer,
    $$SubHutangTableAnnotationComposer,
    $$SubHutangTableCreateCompanionBuilder,
    $$SubHutangTableUpdateCompanionBuilder,
    (
      SubHutangData,
      BaseReferences<_$AppDatabase, $SubHutangTable, SubHutangData>
    ),
    SubHutangData,
    PrefetchHooks Function()> {
  $$SubHutangTableTableManager(_$AppDatabase db, $SubHutangTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubHutangTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubHutangTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubHutangTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> hutangId = const Value.absent(),
            Value<int?> bayarCicilan = const Value.absent(),
            Value<DateTime> createAt = const Value.absent(),
          }) =>
              SubHutangCompanion(
            id: id,
            hutangId: hutangId,
            bayarCicilan: bayarCicilan,
            createAt: createAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int hutangId,
            Value<int?> bayarCicilan = const Value.absent(),
            Value<DateTime> createAt = const Value.absent(),
          }) =>
              SubHutangCompanion.insert(
            id: id,
            hutangId: hutangId,
            bayarCicilan: bayarCicilan,
            createAt: createAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubHutangTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubHutangTable,
    SubHutangData,
    $$SubHutangTableFilterComposer,
    $$SubHutangTableOrderingComposer,
    $$SubHutangTableAnnotationComposer,
    $$SubHutangTableCreateCompanionBuilder,
    $$SubHutangTableUpdateCompanionBuilder,
    (
      SubHutangData,
      BaseReferences<_$AppDatabase, $SubHutangTable, SubHutangData>
    ),
    SubHutangData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BarangTableTableManager get barang =>
      $$BarangTableTableManager(_db, _db.barang);
  $$TransaksiTableTableManager get transaksi =>
      $$TransaksiTableTableManager(_db, _db.transaksi);
  $$PelangganTableTableManager get pelanggan =>
      $$PelangganTableTableManager(_db, _db.pelanggan);
  $$BarangPelangganTableTableManager get barangPelanggan =>
      $$BarangPelangganTableTableManager(_db, _db.barangPelanggan);
  $$HutangTableTableManager get hutang =>
      $$HutangTableTableManager(_db, _db.hutang);
  $$HutangTokoKMTableTableManager get hutangTokoKM =>
      $$HutangTokoKMTableTableManager(_db, _db.hutangTokoKM);
  $$SubHutangTableTableManager get subHutang =>
      $$SubHutangTableTableManager(_db, _db.subHutang);
}
