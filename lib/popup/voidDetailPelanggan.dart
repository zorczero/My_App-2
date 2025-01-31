import 'package:flutter/material.dart';
import '../details/detail_pelanggan.dart';
import '../database/database.dart';

// Fungsi untuk menampilkan detail pelanggan
void showDetailPelanggan(BuildContext context, PelangganData pelanggan) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailPelanggan(pelanggan: pelanggan),
    ),
  );
}
