import 'package:drift/drift.dart';

class Transaksi extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionHutangId => integer().nullable()();
  TextColumn get barang => text()();
  TextColumn get hargaBarang => text()();
  TextColumn get jumlahBarang => text()();
  IntColumn get subTotalHarga => integer()();
  IntColumn get totalHarga => integer()();
  BoolColumn get isPaid => boolean()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get customerName => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
