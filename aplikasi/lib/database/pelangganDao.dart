import 'package:drift/drift.dart';
import 'barangPelanggan.dart';
import 'database.dart';
import 'hutang.dart';
import 'pelanggan.dart';

part 'pelangganDao.g.dart';

@DriftAccessor(tables: [Pelanggan, BarangPelanggan, Hutang])
class PelangganDao extends DatabaseAccessor<AppDatabase>
    with _$PelangganDaoMixin {
  PelangganDao(AppDatabase db) : super(db);

  Future<int> getSubJumlahHutangByPelangganId(int pelangganId) async {
    final query = select(hutang)
      ..where((tbl) => tbl.pelangganId.equals(pelangganId))
      ..orderBy([(t) => OrderingTerm.desc(t.tanggalHutang)]);
    final result = await query.get();
    return result.isNotEmpty ? result.first.subJumlahHutang : 0;
  }


  // Delete pelanggan by ID
  Future<void> deletePelanggan(int id) async {
    await (delete(pelanggan)..where((p) => p.id.equals(id))).go();
  }

  // Update hutang for pelanggan
  Future<int> updatePelangganHutang(int id, int newHutang) async {
    return (update(pelanggan)..where((p) => p.id.equals(id))).write(
      PelangganCompanion(hutang: Value(newHutang)),
    );
  }

  // Update barang pelanggan by ID
  Future<void> updateBarangPelanggan(BarangPelangganCompanion barang) async {
    if (barang.id.present) {
      await (update(barangPelanggan)
            ..where((t) => t.id.equals(barang.id.value)))
          .write(barang);
    } else {
      throw ArgumentError("ID harus disediakan untuk update barang pelanggan.");
    }
  }

  // Watch barang pelanggan by pelangganId
  Stream<List<BarangPelangganData>> watchBarangByPelangganId(int pelangganId) {
    return (select(barangPelanggan)
          ..where((b) => b.pelangganId.equals(pelangganId)))
        .watch();
  }

  // Get barang pelanggan by ID
  Future<BarangPelangganData?> getBarangById(int id) {
    return (select(barangPelanggan)..where((b) => b.id.equals(id)))
        .getSingleOrNull();
  }

  // Get pelanggan by name
  Future<PelangganData?> getPelangganByName(String nama) {
    return (select(pelanggan)..where((p) => p.nama.equals(nama)))
        .getSingleOrNull();
  }

  // Insert a new pelanggan entry
  Future<int> insertPelanggan(PelangganCompanion entry) {
    return into(pelanggan).insert(entry);
  }

  // Insert a new barang pelanggan entry
  Future<int> insertBarangPelanggan(BarangPelangganCompanion entry) {
    return into(barangPelanggan).insert(entry);
  }

  // Get all pelanggan records
  Future<List<PelangganData>> getAllPelanggan() {
    return select(pelanggan).get();
  }

  // Get barang pelanggan by pelangganId
  Future<List<BarangPelangganData>> getBarangByPelangganId(int pelangganId) {
    return (select(barangPelanggan)
          ..where((b) => b.pelangganId.equals(pelangganId)))
        .get();
  }
}
