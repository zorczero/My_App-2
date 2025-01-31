import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';

class DetailHomePelanggan extends StatefulWidget {
  final PelangganData pelanggan;
  final List<BarangPelangganData> barangList;
  final NumberFormat currencyFormatter;
  final Function onNavigateToHome;
  final Function onNavigateToHutang;

  const DetailHomePelanggan({
    super.key,
    required this.pelanggan,
    required this.barangList,
    required this.currencyFormatter,
    required this.onNavigateToHome,
    required this.onNavigateToHutang,
  });

  @override
  _DetailHomePelangganState createState() => _DetailHomePelangganState();
}

class _DetailHomePelangganState extends State<DetailHomePelanggan> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => widget.onNavigateToHome(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => widget.onNavigateToHutang(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'Hutang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Nama Pelanggan: ${widget.pelanggan.nama}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey),
            const Text(
              'Daftar Barang Pelanggan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            widget.barangList.isEmpty
                ? const Text(
                    'Tidak ada barang.',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                    ),
                  )
                : DataTable(
                    columnSpacing: 20,
                    headingRowColor: WidgetStateProperty.all(Colors.black),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Nama Barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Harga',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                    rows: widget.barangList
                        .map(
                          (barang) => DataRow(
                            cells: [
                              DataCell(Text(
                                barang.namaBarang,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )),
                              DataCell(Text(
                                widget.currencyFormatter.format(barang.harga),
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 14,
                                ),
                              )),
                            ],
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
