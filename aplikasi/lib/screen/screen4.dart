import 'package:flutter/material.dart';

import '../Pembukuan/edit_stock.dart';
import '../Pembukuan/jatuh_tempo.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembukuan',
          style: TextStyle(
            fontSize: 20, // Mengatur ukuran font
          ),
        ),
        toolbarHeight: 35, // Mengatur tinggi AppBar
        backgroundColor:
            Colors.blue, // Kamu bisa mengganti warna sesuai kebutuhan
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16.0), // Memberikan padding di sekitar teks
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 20), // Memberikan jarak antara teks dan tombol
            SizedBox(
              width: double.infinity, // Mengatur lebar tombol menjadi 100%
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Mengatur warna latar belakang tombol
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditStock()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                  child: const Text(
                    'Edit Stock',
                    style: TextStyle(
                      color: Colors.black, // Warna teks tombol
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 20), // Memberikan jarak antara teks dan tombol
            SizedBox(
              width: double.infinity, // Mengatur lebar tombol menjadi 100%
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Mengatur warna latar belakang tombol
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JatuhTempo()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                  child: const Text(
                    'Jatuh Tempo',
                    style: TextStyle(
                      color: Colors.black, // Warna teks tombol
                    ),
                  ),
                ),
              ),
            ),
            // Tambahkan lebih banyak widget teks atau konten di sini sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
