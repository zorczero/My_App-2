import 'package:drift/drift.dart';

class HutangTokoKM extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaToko => text().withLength(min: 1, max: 50)();
  DateTimeColumn get jatuhTempo => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
}
