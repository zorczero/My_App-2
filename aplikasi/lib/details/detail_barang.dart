import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import library intl
import '../database/database.dart';

class HutangData {
  final int id;
  final int jumlahHutang;

  HutangData({required this.id, required this.jumlahHutang});
}

class DetailBarang extends StatelessWidget {
  final BarangData itemDetails;

  const DetailBarang({Key? key, required this.itemDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // Formatter untuk format angka dengan ribuan
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    final NumberFormat numberFormat = NumberFormat('#,##0', 'id_ID');

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Barang"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
              label: 'Nama Barang:',
              value: itemDetails.name,
              textStyle: textTheme.titleLarge?.copyWith(fontSize: 20),
            ),
            _buildDetailRow(
              label: 'Code:',
              value: itemDetails.kode,
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            _buildDetailRow(
              label: 'Modal:',
              value: currencyFormat
                  .format(itemDetails.modal), // Format modal sebagai mata uang
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            _buildDetailRow(
              label: 'Selling Price:',
              value: currencyFormat.format(itemDetails
                  .harga_jual), // Format harga jual sebagai mata uang
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            _buildDetailRow(
              label: 'Stock:',
              value: numberFormat
                  .format(itemDetails.stock), // Format stock dengan ribuan
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            _buildDetailRow(
              label: 'Di Buat Tanggal:',
              value: itemDetails.createdAt.toString(),
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            _buildDetailRow(
              label: 'Terakhir Di Update:',
              value: itemDetails.updatedAt.toString(),
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    TextStyle? textStyle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: textStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
