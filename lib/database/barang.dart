import 'package:drift/drift.dart';

class Barang extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  TextColumn get kode => text().withLength(max: 128)();
  IntColumn get modal => integer()();
  IntColumn get harga_jual => integer()();
  IntColumn get stock => integer()();
  IntColumn get type => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
