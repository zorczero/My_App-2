import 'package:flutter/material.dart';
import '../database/database.dart';

class SearchNamaPelanggan extends StatefulWidget {
  const SearchNamaPelanggan({super.key});

  @override
  State<SearchNamaPelanggan> createState() => _SearchNamaPelangganState();
}

class _SearchNamaPelangganState extends State<SearchNamaPelanggan> {
  final database = AppDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Pelanggan'),
      ),
      body: FutureBuilder<List<PelangganData>>(
        future: database.select(database.pelanggan).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada pelanggan'));
          }

          final pelangganList = snapshot.data!;

          return ListView.builder(
            itemCount: pelangganList.length,
            itemBuilder: (context, index) {
              final pelanggan = pelangganList[index];
              return ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text(pelanggan.nama),
                onTap: () {
                  Navigator.pop(context, pelanggan.nama);
                },
              );
            },
          );
        },
      ),
    );
  }
}
