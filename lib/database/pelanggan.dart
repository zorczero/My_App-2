import 'package:drift/drift.dart';

class Pelanggan extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 1, max: 50)();
  IntColumn get hutang => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(Constant(true))();
}
