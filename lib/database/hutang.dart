import 'package:drift/drift.dart';

class Hutang extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 1, max: 50)();
  TextColumn get pelangganSales =>
      text().withLength(min: 1, max: 50).nullable()();
  BoolColumn get isPaid => boolean()();
  TextColumn get hargaBarang => text()();
  TextColumn get jumlahBarang => text()();
  IntColumn get pelangganId => integer()();
  IntColumn get jumlahHutang => integer()();
  IntColumn get subJumlahHutang => integer()();
  DateTimeColumn get tanggalHutang => dateTime()();
  DateTimeColumn get tanggalJatuhTempo => dateTime().nullable()();
  DateTimeColumn get createAt => dateTime().withDefault(currentDateAndTime)();
}
