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
  int get hashCode => Object.hash(id, barang, hargaBarang, jumlahBarang,
      subTotalHarga, totalHarga, isPaid, dueDate, customerName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransaksiData &&
          other.id == this.id &&
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
  @override
  List<GeneratedColumn> get $columns => [id, nama, hutang];
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
  const PelangganData(
      {required this.id, required this.nama, required this.hutang});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['hutang'] = Variable<int>(hutang);
    return map;
  }

  PelangganCompanion toCompanion(bool nullToAbsent) {
    return PelangganCompanion(
      id: Value(id),
      nama: Value(nama),
      hutang: Value(hutang),
    );
  }

  factory PelangganData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PelangganData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      hutang: serializer.fromJson<int>(json['hutang']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'hutang': serializer.toJson<int>(hutang),
    };
  }

  PelangganData copyWith({int? id, String? nama, int? hutang}) => PelangganData(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        hutang: hutang ?? this.hutang,
      );
  PelangganData copyWithCompanion(PelangganCompanion data) {
    return PelangganData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      hutang: data.hutang.present ? data.hutang.value : this.hutang,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PelangganData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('hutang: $hutang')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, hutang);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PelangganData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.hutang == this.hutang);
}

class PelangganCompanion extends UpdateCompanion<PelangganData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<int> hutang;
  const PelangganCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.hutang = const Value.absent(),
  });
  PelangganCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.hutang = const Value.absent(),
  }) : nama = Value(nama);
  static Insertable<PelangganData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<int>? hutang,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (hutang != null) 'hutang': hutang,
    });
  }

  PelangganCompanion copyWith(
      {Value<int>? id, Value<String>? nama, Value<int>? hutang}) {
    return PelangganCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      hutang: hutang ?? this.hutang,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PelangganCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('hutang: $hutang')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, pelangganId, jumlahHutang, subJumlahHutang, tanggalHutang];
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
      pelangganId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pelanggan_id'])!,
      jumlahHutang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jumlah_hutang'])!,
      subJumlahHutang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_jumlah_hutang'])!,
      tanggalHutang: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}tanggal_hutang'])!,
    );
  }

  @override
  $HutangTable createAlias(String alias) {
    return $HutangTable(attachedDatabase, alias);
  }
}

class HutangData extends DataClass implements Insertable<HutangData> {
  final int id;
  final int pelangganId;
  final int jumlahHutang;
  final int subJumlahHutang;
  final DateTime tanggalHutang;
  const HutangData(
      {required this.id,
      required this.pelangganId,
      required this.jumlahHutang,
      required this.subJumlahHutang,
      required this.tanggalHutang});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pelanggan_id'] = Variable<int>(pelangganId);
    map['jumlah_hutang'] = Variable<int>(jumlahHutang);
    map['sub_jumlah_hutang'] = Variable<int>(subJumlahHutang);
    map['tanggal_hutang'] = Variable<DateTime>(tanggalHutang);
    return map;
  }

  HutangCompanion toCompanion(bool nullToAbsent) {
    return HutangCompanion(
      id: Value(id),
      pelangganId: Value(pelangganId),
      jumlahHutang: Value(jumlahHutang),
      subJumlahHutang: Value(subJumlahHutang),
      tanggalHutang: Value(tanggalHutang),
    );
  }

  factory HutangData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HutangData(
      id: serializer.fromJson<int>(json['id']),
      pelangganId: serializer.fromJson<int>(json['pelangganId']),
      jumlahHutang: serializer.fromJson<int>(json['jumlahHutang']),
      subJumlahHutang: serializer.fromJson<int>(json['subJumlahHutang']),
      tanggalHutang: serializer.fromJson<DateTime>(json['tanggalHutang']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pelangganId': serializer.toJson<int>(pelangganId),
      'jumlahHutang': serializer.toJson<int>(jumlahHutang),
      'subJumlahHutang': serializer.toJson<int>(subJumlahHutang),
      'tanggalHutang': serializer.toJson<DateTime>(tanggalHutang),
    };
  }

  HutangData copyWith(
          {int? id,
          int? pelangganId,
          int? jumlahHutang,
          int? subJumlahHutang,
          DateTime? tanggalHutang}) =>
      HutangData(
        id: id ?? this.id,
        pelangganId: pelangganId ?? this.pelangganId,
        jumlahHutang: jumlahHutang ?? this.jumlahHutang,
        subJumlahHutang: subJumlahHutang ?? this.subJumlahHutang,
        tanggalHutang: tanggalHutang ?? this.tanggalHutang,
      );
  HutangData copyWithCompanion(HutangCompanion data) {
    return HutangData(
      id: data.id.present ? data.id.value : this.id,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('HutangData(')
          ..write('id: $id, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('jumlahHutang: $jumlahHutang, ')
          ..write('subJumlahHutang: $subJumlahHutang, ')
          ..write('tanggalHutang: $tanggalHutang')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, pelangganId, jumlahHutang, subJumlahHutang, tanggalHutang);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HutangData &&
          other.id == this.id &&
          other.pelangganId == this.pelangganId &&
          other.jumlahHutang == this.jumlahHutang &&
          other.subJumlahHutang == this.subJumlahHutang &&
          other.tanggalHutang == this.tanggalHutang);
}

class HutangCompanion extends UpdateCompanion<HutangData> {
  final Value<int> id;
  final Value<int> pelangganId;
  final Value<int> jumlahHutang;
  final Value<int> subJumlahHutang;
  final Value<DateTime> tanggalHutang;
  const HutangCompanion({
    this.id = const Value.absent(),
    this.pelangganId = const Value.absent(),
    this.jumlahHutang = const Value.absent(),
    this.subJumlahHutang = const Value.absent(),
    this.tanggalHutang = const Value.absent(),
  });
  HutangCompanion.insert({
    this.id = const Value.absent(),
    required int pelangganId,
    required int jumlahHutang,
    required int subJumlahHutang,
    required DateTime tanggalHutang,
  })  : pelangganId = Value(pelangganId),
        jumlahHutang = Value(jumlahHutang),
        subJumlahHutang = Value(subJumlahHutang),
        tanggalHutang = Value(tanggalHutang);
  static Insertable<HutangData> custom({
    Expression<int>? id,
    Expression<int>? pelangganId,
    Expression<int>? jumlahHutang,
    Expression<int>? subJumlahHutang,
    Expression<DateTime>? tanggalHutang,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pelangganId != null) 'pelanggan_id': pelangganId,
      if (jumlahHutang != null) 'jumlah_hutang': jumlahHutang,
      if (subJumlahHutang != null) 'sub_jumlah_hutang': subJumlahHutang,
      if (tanggalHutang != null) 'tanggal_hutang': tanggalHutang,
    });
  }

  HutangCompanion copyWith(
      {Value<int>? id,
      Value<int>? pelangganId,
      Value<int>? jumlahHutang,
      Value<int>? subJumlahHutang,
      Value<DateTime>? tanggalHutang}) {
    return HutangCompanion(
      id: id ?? this.id,
      pelangganId: pelangganId ?? this.pelangganId,
      jumlahHutang: jumlahHutang ?? this.jumlahHutang,
      subJumlahHutang: subJumlahHutang ?? this.subJumlahHutang,
      tanggalHutang: tanggalHutang ?? this.tanggalHutang,
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
    if (jumlahHutang.present) {
      map['jumlah_hutang'] = Variable<int>(jumlahHutang.value);
    }
    if (subJumlahHutang.present) {
      map['sub_jumlah_hutang'] = Variable<int>(subJumlahHutang.value);
    }
    if (tanggalHutang.present) {
      map['tanggal_hutang'] = Variable<DateTime>(tanggalHutang.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HutangCompanion(')
          ..write('id: $id, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('jumlahHutang: $jumlahHutang, ')
          ..write('subJumlahHutang: $subJumlahHutang, ')
          ..write('tanggalHutang: $tanggalHutang')
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
  late final PelangganDao pelangganDao = PelangganDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [barang, transaksi, pelanggan, barangPelanggan, hutang];
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

class $$BarangTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarangTable,
    BarangData,
    $$BarangTableFilterComposer,
    $$BarangTableOrderingComposer,
    $$BarangTableCreateCompanionBuilder,
    $$BarangTableUpdateCompanionBuilder> {
  $$BarangTableTableManager(_$AppDatabase db, $BarangTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BarangTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BarangTableOrderingComposer(ComposerState(db, table)),
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
        ));
}

class $$BarangTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BarangTable> {
  $$BarangTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get kode => $state.composableBuilder(
      column: $state.table.kode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get modal => $state.composableBuilder(
      column: $state.table.modal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get harga_jual => $state.composableBuilder(
      column: $state.table.harga_jual,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BarangTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BarangTable> {
  $$BarangTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get kode => $state.composableBuilder(
      column: $state.table.kode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get modal => $state.composableBuilder(
      column: $state.table.modal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get harga_jual => $state.composableBuilder(
      column: $state.table.harga_jual,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TransaksiTableCreateCompanionBuilder = TransaksiCompanion Function({
  Value<int> id,
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

class $$TransaksiTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransaksiTable,
    TransaksiData,
    $$TransaksiTableFilterComposer,
    $$TransaksiTableOrderingComposer,
    $$TransaksiTableCreateCompanionBuilder,
    $$TransaksiTableUpdateCompanionBuilder> {
  $$TransaksiTableTableManager(_$AppDatabase db, $TransaksiTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransaksiTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransaksiTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
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
        ));
}

class $$TransaksiTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransaksiTable> {
  $$TransaksiTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get barang => $state.composableBuilder(
      column: $state.table.barang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hargaBarang => $state.composableBuilder(
      column: $state.table.hargaBarang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get jumlahBarang => $state.composableBuilder(
      column: $state.table.jumlahBarang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get subTotalHarga => $state.composableBuilder(
      column: $state.table.subTotalHarga,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalHarga => $state.composableBuilder(
      column: $state.table.totalHarga,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isPaid => $state.composableBuilder(
      column: $state.table.isPaid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dueDate => $state.composableBuilder(
      column: $state.table.dueDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get customerName => $state.composableBuilder(
      column: $state.table.customerName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransaksiTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransaksiTable> {
  $$TransaksiTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get barang => $state.composableBuilder(
      column: $state.table.barang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hargaBarang => $state.composableBuilder(
      column: $state.table.hargaBarang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get jumlahBarang => $state.composableBuilder(
      column: $state.table.jumlahBarang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get subTotalHarga => $state.composableBuilder(
      column: $state.table.subTotalHarga,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalHarga => $state.composableBuilder(
      column: $state.table.totalHarga,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isPaid => $state.composableBuilder(
      column: $state.table.isPaid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dueDate => $state.composableBuilder(
      column: $state.table.dueDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get customerName => $state.composableBuilder(
      column: $state.table.customerName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PelangganTableCreateCompanionBuilder = PelangganCompanion Function({
  Value<int> id,
  required String nama,
  Value<int> hutang,
});
typedef $$PelangganTableUpdateCompanionBuilder = PelangganCompanion Function({
  Value<int> id,
  Value<String> nama,
  Value<int> hutang,
});

class $$PelangganTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PelangganTable,
    PelangganData,
    $$PelangganTableFilterComposer,
    $$PelangganTableOrderingComposer,
    $$PelangganTableCreateCompanionBuilder,
    $$PelangganTableUpdateCompanionBuilder> {
  $$PelangganTableTableManager(_$AppDatabase db, $PelangganTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PelangganTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PelangganTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nama = const Value.absent(),
            Value<int> hutang = const Value.absent(),
          }) =>
              PelangganCompanion(
            id: id,
            nama: nama,
            hutang: hutang,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nama,
            Value<int> hutang = const Value.absent(),
          }) =>
              PelangganCompanion.insert(
            id: id,
            nama: nama,
            hutang: hutang,
          ),
        ));
}

class $$PelangganTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PelangganTable> {
  $$PelangganTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nama => $state.composableBuilder(
      column: $state.table.nama,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hutang => $state.composableBuilder(
      column: $state.table.hutang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter barangPelangganRefs(
      ComposableFilter Function($$BarangPelangganTableFilterComposer f) f) {
    final $$BarangPelangganTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.barangPelanggan,
            getReferencedColumn: (t) => t.pelangganId,
            builder: (joinBuilder, parentComposers) =>
                $$BarangPelangganTableFilterComposer(ComposerState($state.db,
                    $state.db.barangPelanggan, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PelangganTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PelangganTable> {
  $$PelangganTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nama => $state.composableBuilder(
      column: $state.table.nama,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hutang => $state.composableBuilder(
      column: $state.table.hutang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

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

class $$BarangPelangganTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarangPelangganTable,
    BarangPelangganData,
    $$BarangPelangganTableFilterComposer,
    $$BarangPelangganTableOrderingComposer,
    $$BarangPelangganTableCreateCompanionBuilder,
    $$BarangPelangganTableUpdateCompanionBuilder> {
  $$BarangPelangganTableTableManager(
      _$AppDatabase db, $BarangPelangganTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BarangPelangganTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BarangPelangganTableOrderingComposer(ComposerState(db, table)),
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
        ));
}

class $$BarangPelangganTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BarangPelangganTable> {
  $$BarangPelangganTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get namaBarang => $state.composableBuilder(
      column: $state.table.namaBarang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get harga => $state.composableBuilder(
      column: $state.table.harga,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PelangganTableFilterComposer get pelangganId {
    final $$PelangganTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pelangganId,
        referencedTable: $state.db.pelanggan,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PelangganTableFilterComposer(ComposerState(
                $state.db, $state.db.pelanggan, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BarangPelangganTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BarangPelangganTable> {
  $$BarangPelangganTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get namaBarang => $state.composableBuilder(
      column: $state.table.namaBarang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get harga => $state.composableBuilder(
      column: $state.table.harga,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PelangganTableOrderingComposer get pelangganId {
    final $$PelangganTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pelangganId,
        referencedTable: $state.db.pelanggan,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PelangganTableOrderingComposer(ComposerState(
                $state.db, $state.db.pelanggan, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$HutangTableCreateCompanionBuilder = HutangCompanion Function({
  Value<int> id,
  required int pelangganId,
  required int jumlahHutang,
  required int subJumlahHutang,
  required DateTime tanggalHutang,
});
typedef $$HutangTableUpdateCompanionBuilder = HutangCompanion Function({
  Value<int> id,
  Value<int> pelangganId,
  Value<int> jumlahHutang,
  Value<int> subJumlahHutang,
  Value<DateTime> tanggalHutang,
});

class $$HutangTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HutangTable,
    HutangData,
    $$HutangTableFilterComposer,
    $$HutangTableOrderingComposer,
    $$HutangTableCreateCompanionBuilder,
    $$HutangTableUpdateCompanionBuilder> {
  $$HutangTableTableManager(_$AppDatabase db, $HutangTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HutangTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HutangTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> pelangganId = const Value.absent(),
            Value<int> jumlahHutang = const Value.absent(),
            Value<int> subJumlahHutang = const Value.absent(),
            Value<DateTime> tanggalHutang = const Value.absent(),
          }) =>
              HutangCompanion(
            id: id,
            pelangganId: pelangganId,
            jumlahHutang: jumlahHutang,
            subJumlahHutang: subJumlahHutang,
            tanggalHutang: tanggalHutang,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int pelangganId,
            required int jumlahHutang,
            required int subJumlahHutang,
            required DateTime tanggalHutang,
          }) =>
              HutangCompanion.insert(
            id: id,
            pelangganId: pelangganId,
            jumlahHutang: jumlahHutang,
            subJumlahHutang: subJumlahHutang,
            tanggalHutang: tanggalHutang,
          ),
        ));
}

class $$HutangTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HutangTable> {
  $$HutangTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pelangganId => $state.composableBuilder(
      column: $state.table.pelangganId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get jumlahHutang => $state.composableBuilder(
      column: $state.table.jumlahHutang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get subJumlahHutang => $state.composableBuilder(
      column: $state.table.subJumlahHutang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get tanggalHutang => $state.composableBuilder(
      column: $state.table.tanggalHutang,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HutangTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HutangTable> {
  $$HutangTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pelangganId => $state.composableBuilder(
      column: $state.table.pelangganId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get jumlahHutang => $state.composableBuilder(
      column: $state.table.jumlahHutang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get subJumlahHutang => $state.composableBuilder(
      column: $state.table.subJumlahHutang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get tanggalHutang => $state.composableBuilder(
      column: $state.table.tanggalHutang,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

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
}
