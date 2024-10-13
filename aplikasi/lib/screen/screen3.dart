import 'package:flutter/material.dart';
import '../database/database.dart';
import '../details/detail_pelanggan.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late AppDatabase _database;
  List<PelangganData> _pelangganList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _fetchPelangganData();
  }

  Future<void> _fetchPelangganData() async {
    try {
      final pelangganDao = _database.pelangganDao;
      final pelangganList = await pelangganDao.getAllPelanggan();
      setState(() {
        _pelangganList = pelangganList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  Future<void> _deletePelanggan(int id) async {
    try {
      final pelangganDao = _database.pelangganDao;
      await pelangganDao.deletePelanggan(id);

      setState(() {
        _pelangganList.removeWhere((pelanggan) => pelanggan.id == id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pelanggan berhasil dihapus')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_pelangganList.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return ListView.builder(
      itemCount: _pelangganList.length,
      itemBuilder: (context, index) {
        final pelanggan = _pelangganList[index];
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
                  pelanggan.nama,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Hutang: ${pelanggan.hutang}', // Menampilkan jumlah hutang dari data pelanggan
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Detail'),
                    onPressed: () {
                      // Navigasi ke DetailPelanggan dengan data pelanggan
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPelanggan(
                            pelanggan: pelanggan, // Kirim data pelanggan
                          ),
                        ),
                      );
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
  }
}
