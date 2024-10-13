import 'package:drift/drift.dart';

class Hutang extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pelangganId => integer()();
  IntColumn get jumlahHutang => integer()();
  IntColumn get subJumlahHutang => integer()();
  DateTimeColumn get tanggalHutang => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class HutangCompanion extends UpdateCompanion<Hutang> {
  final Value<int?> id;
  final Value<int> pelangganId;
  final Value<int> jumlahHutang;
  final Value<int> subJumlahHutang;
  final Value<DateTime> tanggalHutang;

  const HutangCompanion({
    this.id = const Value.absent(),
    required this.pelangganId,
    required this.jumlahHutang,
    required this.subJumlahHutang,
    required this.tanggalHutang,
  });

  HutangCompanion copyWith({
    Value<int?>? id,
    Value<int>? pelangganId,
    Value<int>? jumlahHutang,
    Value<int>? subJumlahHutang,
    Value<DateTime>? tanggalHutang,
  }) {
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
}
