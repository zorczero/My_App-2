import 'package:aplikasi/database/pelanggan.dart';
import 'package:drift/drift.dart';

class BarangPelanggan extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pelangganId => integer().references(Pelanggan, #id)();
  TextColumn get namaBarang => text().withLength(min: 1, max: 50)();
  RealColumn get harga => real()();
}
