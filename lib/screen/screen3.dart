import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../popup/voidDetailPelanggan.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  late AppDatabase _database;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
  }

  Future<String> _getHutangForPelanggan(int pelangganId) async {
    final hutang = await _database.pelangganDao
        .getSubJumlahHutangByPelangganId(pelangganId);
    return currencyFormatter.format(hutang);
  }

  // Delete customer (pelanggan)
  Future<void> _deletePelanggan(int id) async {
    try {
      final pelangganDao = _database.pelangganDao;
      await pelangganDao.deletePelanggan(id);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pelanggan berhasil dihapus')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting data: $e')),
      );
    }
  }

  Stream<List<PelangganData>> _getPelangganStream(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return _database.pelangganDao.watchActivePelanggan();
      case 2:
        return _database.pelangganDao.watchInactivePelanggan();
      default:
        return _database.pelangganDao.watchAllPelanggan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<PelangganData>>(
        stream: _getPelangganStream(_selectedIndex), // Use the dynamic stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Terjadi kesalahan: ${snapshot.error}'),
            );
          }

          final pelangganList = snapshot.data;
          if (pelangganList == null || pelangganList.isEmpty) {
            return const Center(child: Text('Belum ada data pelanggan.'));
          }

          return ListView.builder(
            itemCount: pelangganList.length,
            itemBuilder: (context, index) {
              final pelanggan = pelangganList[index];

              // Fetch debt (hutang) for this customer
              return FutureBuilder<String>(
                future: _getHutangForPelanggan(pelanggan.id),
                builder: (context, hutangSnapshot) {
                  if (hutangSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (hutangSnapshot.hasError) {
                    return Center(
                        child: Text(
                            'Error fetching hutang: ${hutangSnapshot.error}'));
                  }

                  final hutang = hutangSnapshot.data ?? 'Rp 0';

                  return Card(
                    color: Colors.black12,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            "${pelanggan.nama} (${pelanggan.isActive ? 'Pelanggan' : 'Sales'})",
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Hutang: ${hutang}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Detail'),
                              onPressed: () {
                                showDetailPelanggan(context, pelanggan);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Hapus'),
                              onPressed: () {
                                _deletePelanggan(pelanggan.id);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
