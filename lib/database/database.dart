import 'dart:io';
import 'package:aplikasi/database/pelangganDao.dart';
import 'package:aplikasi/database/subHutang.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'barang.dart';
import 'pelanggan.dart';
import 'transaction.dart';
import 'barangPelanggan.dart';
import 'hutang.dart';
import 'hutangToko.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Barang,
    Transaksi,
    Pelanggan,
    BarangPelanggan,
    Hutang,
    HutangTokoKM,
    SubHutang
  ],
  daos: [PelangganDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<BarangData>> watchAllBarang() {
    return (select(barang)..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();
  }

  Future<PelangganData?> getCustomerByName(String nama) async {
    return (select(pelanggan)..where((tbl) => tbl.nama.equals(nama)))
        .getSingleOrNull();
  }

// Watch all HutangTokoKM entries
  Stream<List<HutangTokoKMData>> watchAllHutangTokoKM() {
    return (select(hutangTokoKM)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // Delete HutangToko entry
  Future<int> deleteHutangToko(int id) {
    return (delete(hutangTokoKM)..where((t) => t.id.equals(id))).go();
  }

  // Update HutangToko entry
  Future<bool> updateHutangToko(
      int id, String namaToko, DateTime jatuhTempo) async {
    return update(hutangTokoKM).replace(
      HutangTokoKMData(
        id: id,
        namaToko: namaToko,
        jatuhTempo: jatuhTempo,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<int> insertBarang(BarangCompanion entry) async {
    try {
      return await transaction(() async {
        final id = await into(barang).insert(entry);
        return id;
      });
    } catch (e) {
      print('Error in insertBarang: ${e.toString()}');
      rethrow;
    }
  }

  Future<bool> deleteBarangRepo(int id) async {
    try {
      final count = await transaction(() async {
        final result =
            await (delete(barang)..where((tbl) => tbl.id.equals(id))).go();
        return result;
      });
      return count > 0;
    } catch (e) {
      print('Error in deleteBarang: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> updateHutangPembayaran(int hutangId, int pembayaran) async {
    // Get the current hutang data
    final hutangList =
        await (select(hutang)..where((h) => h.id.equals(hutangId))).get();

    if (hutangList.isEmpty) {
      throw Exception('Hutang tidak ditemukan');
    }

    final currentHutang = hutangList.first;

    // Calculate new subJumlahHutang after payment
    int newSubJumlahHutang = currentHutang.subJumlahHutang - pembayaran;

    // Make sure we don't go below 0
    if (newSubJumlahHutang < 0) {
      newSubJumlahHutang = 0;
    }

    // Check if the debt is fully paid
    bool isFullyPaid = newSubJumlahHutang == 0;

    // Update the original record
    await (update(hutang)..where((h) => h.id.equals(hutangId))).write(
      HutangCompanion(
        subJumlahHutang: Value(newSubJumlahHutang),
        isPaid: Value(isFullyPaid),
        createAt: Value(DateTime.now()),
      ),
    );
  }

  Future<List<SubHutangData>> getSubHutangs(int hutangId) {
    return (select(subHutang)..where((h) => h.hutangId.equals(hutangId))).get();
  }

  Future<void> insertLogPembayaran(int hutangId, int pembayaran) async {
    final log = SubHutangCompanion(
      hutangId: Value(hutangId),
      bayarCicilan: Value(pembayaran),
    );

    await into(subHutang).insert(log);
  }

  Future<List<TransaksiData>> getHutangTransaksiByPelangganId(int pelangganId) {
    return (select(transaksi)
          ..where((t) =>
              t.customerName.equals(pelangganId.toString()) &
              t.isPaid.equals(false)))
        .get();
  }

  Future<int> updateJumlahHutang(
      int pelangganId, int newJumlahHutang, DateTime date) async {
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

  Future<int?> getLatestTransactionIds() async {
    final query = select(transaksi)
      ..orderBy([(t) => OrderingTerm.desc(t.transactionHutangId)])
      ..limit(1);

    final result = await query.getSingleOrNull();
    return result?.transactionHutangId;
  }

  Future<HutangData?> getLatestHutangByPelangganId(int pelangganId) {
    return (select(hutang)
          ..where((h) => h.pelangganId.equals(pelangganId))
          ..orderBy([(h) => OrderingTerm.desc(h.tanggalHutang)])
          ..limit(1))
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

// Untuk StreamBuilder (real-time)
  Stream<List<HutangData>> watchHutangByPelangganId(int pelangganId) {
    return (select(hutang)..where((h) => h.pelangganId.equals(pelangganId)))
        .watch();
  }

  // Contoh metode untuk menambahkan data hutang (opsional, untuk pengujian)
  Future<int> addHutang(HutangCompanion hutangData) {
    return into(hutang).insert(hutangData);
  }

  Future<BarangData?> getItemDetails(String name) async {
    return (select(barang)..where((tbl) => tbl.name.equals(name)))
        .getSingleOrNull();
  }

  PelangganDao get pelangganDao => PelangganDao(this);

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

  Stream<List<TransaksiData>> watchTransaksiByCustomerName(
      String customerName) {
    return (select(transaksi)
          ..where((t) => t.customerName.equals(customerName)))
        .watch();
  }

  Future<void> updateTransactionPaidStatus(int id, bool isPaid) {
    return (update(transaksi)..where((t) => t.id.equals(id)))
        .write(TransaksiCompanion(isPaid: Value(isPaid)));
  }

  Future<List<PelangganData>> getAllPelanggan() => select(pelanggan).get();

  Future<void> markAsLunas(int transactionId) async {
    try {
      await (update(transaksi)
            ..where((tbl) =>
                tbl.id.equals(transactionId))) // Mencari berdasarkan id
          .write(TransaksiCompanion(
              isPaid: Value(true))); // Menandai sebagai lunas

      print('Transaksi berhasil ditandai sebagai lunas');
    } catch (e) {
      print('Gagal menandai transaksi sebagai lunas: $e');
      throw Exception('Error updating transaction: $e');
    }
  }

  // Tambahkan DAO dan query method di sini jika belum
  Stream<List<HutangData>> watchHutangById(int id) =>
      (select(hutang)..where((h) => h.id.equals(id))).watch();

  Future<List<HutangData>> getHutangById(int id) =>
      (select(hutang)..where((h) => h.id.equals(id))).get();

  Future<void> markHutangAsLunas(int id) async {
    await (update(hutang)..where((h) => h.id.equals(id)))
        .write(const HutangCompanion(isPaid: Value(true)));
  }

  // Watch pelanggan berdasarkan customerName di Transaksi
  Stream<List<PelangganData>> watchPelangganBerdasarkanCustomerName(
      String namaCustomer) {
    final query = select(pelanggan).join([
      innerJoin(
        transaksi,
        transaksi.customerName.equalsExp(pelanggan.nama),
      ),
    ])
      ..where(pelanggan.nama
          .equals(namaCustomer)); // Filter berdasarkan nama pelanggan

    return query.watch().map((rows) {
      return rows.map((row) => row.readTable(pelanggan)).toList();
    });
  }

  Future<List<HutangData>> getHutangByNamaPelanggan(
      String namaPelanggan) async {
    final query = select(hutang)
      ..where((tbl) => tbl.nama.equals(namaPelanggan));
    return await query.get();
  }

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'my_database.db'));
      return NativeDatabase(file);
    });
  }
}
