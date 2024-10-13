import 'package:aplikasi/database/pelanggan.dart';
import 'package:aplikasi/database/pelangganDao.dart';
import 'package:aplikasi/database/transaction.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'barang.dart';
import 'barangPelanggan.dart';
import 'hutang.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Barang, Transaksi, Pelanggan, BarangPelanggan, Hutang],
  daos: [PelangganDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  int get schemaVersion => 1;

  Future<List<TransaksiData>> getHutangTransaksiByPelangganId(int pelangganId) {
    return (select(transaksi)
          ..where((t) =>
              t.customerName.equals(pelangganId.toString()) &
              t.isPaid.equals(false)))
        .get();
  }

  Future<int> updateJumlahHutang(int pelangganId, int newJumlahHutang) async {
    return (update(hutang)..where((h) => h.pelangganId.equals(pelangganId)))
        .write(HutangCompanion(
      jumlahHutang: Value(newJumlahHutang),
      tanggalHutang: Value(DateTime.now()),
    ));
  }

  Future<List<HutangData>> getAllHutangByPelangganId(int pelangganId) {
    return (select(hutang)..where((h) => h.pelangganId.equals(pelangganId)))
        .get();
  }

  Future<HutangData?> getLatestHutangByPelangganId(int pelangganId) {
    return (select(hutang)
          ..where((h) => h.pelangganId.equals(pelangganId))
          ..orderBy([(h) => OrderingTerm.desc(h.tanggalHutang)])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<List<BarangData>> watchAllBarang() {
    return (select(barang)..orderBy([(b) => OrderingTerm.asc(b.name)])).watch();
  }

  Future<HutangData?> getHutangByPelangganId(int pelangganId) {
    return (select(hutang)..where((h) => h.pelangganId.equals(pelangganId)))
        .getSingleOrNull();
  }

  Future<List<String>> getAllItemNames() async {
    final items = await select(barang).get();
    return items.map((item) => item.name).toList();
  }

  Future<List<BarangData>> getAllBarang() async {
    return select(barang).get();
  }

  Future<TransaksiData?> getTransactionById(int id) async {
    return (select(transaksi)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<BarangData?> getItemDetails(String name) async {
    return (select(barang)..where((tbl) => tbl.name.equals(name)))
        .getSingleOrNull();
  }

  PelangganDao get pelangganDao => PelangganDao(this);

  Future deleteBarangRepo(int id) async {
    return (delete(barang)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<TransaksiData>> watchAllTransactions() {
    return select(transaksi).watch();
  }

  Stream<List<TransaksiData>> watchHutangTransactions() {
    return (select(transaksi)..where((t) => t.isPaid.equals(false))).watch();
  }

  Stream<List<TransaksiData>> watchLunasTransactions() {
    return (select(transaksi)..where((t) => t.isPaid.equals(true))).watch();
  }

  Stream<List<TransaksiData>> watchOverdueTransactions() {
    final query = select(transaksi)
      ..where((t) =>
          t.dueDate.isSmallerThanValue(DateTime.now()) &
          t.isPaid.equals(false));
    return query.watch();
  }

  Future<void> updateTransactionPaidStatus(int id, bool isPaid) {
    return (update(transaksi)..where((t) => t.id.equals(id)))
        .write(TransaksiCompanion(isPaid: Value(isPaid)));
  }

  Future<List<PelangganData>> getAllPelanggan() => select(pelanggan).get();

  Future<void> markAsLunas(int transactionId) async {
    try {
      await (update(transaksi)..where((tbl) => tbl.id.equals(transactionId)))
          .write(TransaksiCompanion(isPaid: Value(true)));

      print('Transaksi berhasil ditandai sebagai lunas');
    } catch (e) {
      print('Gagal menandai transaksi sebagai lunas: $e');
      throw Exception('Error updating transaction: $e');
    }
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
