import 'package:flutter/material.dart';
import '../database/database.dart';
import '../details/detail_pelanggan.dart';

class SearchDelegateScreen3 extends SearchDelegate<String> {
  final AppDatabase database; // Menyimpan referensi ke database

  SearchDelegateScreen3(this.database);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResultList();
  }

  // Fungsi untuk membangun daftar hasil berdasarkan query
  Widget _buildResultList() {
    return FutureBuilder<List<PelangganData>>(
      future: database.pelangganDao.getAllPelanggan(), // Ambil semua pelanggan
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final List<PelangganData> pelanggan = snapshot.data ?? [];
        final List<PelangganData> results = pelanggan
            .where(
                (item) => item.nama.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return ListView(
          children: results.map((result) {
            return ListTile(
              title: Text(result.nama),
              onTap: () {
                // Navigasi ke halaman detail pelanggan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPelanggan(pelanggan: result),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
