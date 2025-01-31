import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../provider/navbar_provider.dart';

class DetailTransaksi extends StatefulWidget {
  final int transactionId;
  final String customerName;

  const DetailTransaksi({
    super.key,
    required this.transactionId,
    required this.customerName,
  });

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  late Future<TransaksiData?> _dataFuture;
  final database = AppDatabase();
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0);
  final NumberFormat numberFormat = NumberFormat('#,##0', 'id');

  @override
  void initState() {
    super.initState();
    _dataFuture = _fetchData();
  }

  Future<TransaksiData?> _fetchData() async {
    return await database.getTransactionById(widget.transactionId);
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<TransaksiData?>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('No Data Available'));
            } else {
              final transaction = snapshot.data!;
              final items = transaction.barang.split(', ');
              final prices = transaction.hargaBarang.toString().split(', ');
              final quantities =
                  transaction.jumlahBarang.toString().split(', ');

              if (items.length != prices.length ||
                  items.length != quantities.length) {
                return Center(
                  child: Text(
                      'Error: Mismatch in the number of items, prices, or quantities.'),
                );
              }

              return SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FixedColumnWidth(35), // No
                    1: FlexColumnWidth(2.5), // Nama Barang
                    2: FlexColumnWidth(3), // Harga Barang (Diperbesar)
                    3: FixedColumnWidth(40), // jml (Diperpendek)
                    4: FlexColumnWidth(3.0), // Subtotal (Diperbesar)
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Nama Barang',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Harga Barang',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'jml',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Subtotal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var i = 0; i < items.length; i++)
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (i + 1).toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                items[i],
                                overflow: TextOverflow.ellipsis,
                                // Tambahkan ini untuk menampilkan '...'
                                maxLines: 1, // Batasi hanya satu baris
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currencyFormat.format(int.parse(prices[i])),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                numberFormat.format(int.parse(quantities[i])),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currencyFormat.format(int.parse(prices[i]) *
                                    int.parse(quantities[i])),
                              ),
                            ),
                          ),
                        ],
                      ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              currencyFormat.format(transaction.totalHarga),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF1F1F1F),
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<TransaksiData?>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text('No Data Available');
            } else {
              final transaction = snapshot.data!;
              final dueDate = transaction.dueDate;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dueDate != null
                        ? 'Jatuh Tempo: ${DateFormat('dd/MM/yyyy').format(dueDate)}'
                        : 'Jatuh Tempo: Tidak ada',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  if (transaction.customerName!.isEmpty && !transaction.isPaid)
                    ElevatedButton(
                      onPressed: () {
                        _showConfirmationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Lunas',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text(
              'Apakah Anda yakin ingin menandai transaksi ini sebagai lunas?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog tanpa aksi
              },
              child: const Text('Tidak'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _confirmMarkAsLunas();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Ya', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _confirmMarkAsLunas() async {
    try {
      await database.markAsLunas(widget.transactionId);
      final navbarProvider =
          Provider.of<NavbarProvider>(context, listen: false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaksi ditandai sebagai lunas')),
      );

      navbarProvider.navigateTo(3);

      Future.delayed(const Duration(milliseconds: 200), () {
        navbarProvider.navigateTo(0);
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    } catch (e) {
      print('Gagal menandai sebagai lunas: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menandai sebagai lunas: $e')),
      );
    }
  }
}
