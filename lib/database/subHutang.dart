import 'package:drift/drift.dart';

class SubHutang extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get hutangId => integer()();
  IntColumn get bayarCicilan => integer().nullable()();
  DateTimeColumn get createAt => dateTime().withDefault(currentDateAndTime)();
}
