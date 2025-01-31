import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../provider/navbar_provider.dart';

class HutangPelanggan extends StatefulWidget {
  final String customerName;
  final int hutangId;
  const HutangPelanggan(
      {super.key, required this.hutangId, required this.customerName});

  @override
  State<HutangPelanggan> createState() => _HutangPelangganState();
}

class _HutangPelangganState extends State<HutangPelanggan> {
  final database = AppDatabase();
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0);
  final NumberFormat numberFormat = NumberFormat('#,##0', 'id');

  late Stream<List<HutangData>> _hutangStream;
  int _totalHutang = 0;

  @override
  void initState() {
    super.initState();
    _hutangStream = database.watchHutangById(widget.hutangId);
    _calculateTotalHutang();
  }

  Future<void> _calculateTotalHutang() async {
    final hutangList = await database.getHutangById(widget.hutangId);
    int total =
        hutangList.fold(0, (sum, hutang) => sum + hutang.subJumlahHutang);
    setState(() {
      _totalHutang = total;
    });
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hutang: ${widget.customerName}'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            navbarProvider.navigateTo(1);
            Future.delayed(const Duration(milliseconds: 200), () {
              navbarProvider.navigateTo(0);
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<HutangData>>(
          stream: _hutangStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Tidak ada hutang'));
            }

            final hutangList = snapshot.data!;

            return StreamBuilder<List<PelangganData>>(
              stream: database
                  .watchPelangganBerdasarkanCustomerName(widget.customerName),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Center(child: Text('Error: ${streamSnapshot.error}'));
                }

                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final pelangganList = streamSnapshot.data ?? [];

                if (pelangganList.isEmpty) {
                  return const Center(
                      child: Text('Data pelanggan tidak ditemukan'));
                }

                return FutureBuilder<List<SubHutangData>>(
                  future: database.getSubHutangs(widget.hutangId),
                  builder: (context, futureSnapshot) {
                    if (futureSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (futureSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${futureSnapshot.error}'));
                    }

                    final subHutangList = futureSnapshot.data ?? [];
                    final firstHutang = hutangList.first;

                    final totalBayarCicilan = subHutangList.fold<int>(
                        0,
                        (sum, subHutang) =>
                            sum + (subHutang.bayarCicilan ?? 0));

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FixedColumnWidth(35),
                              1: FlexColumnWidth(2.5),
                              2: FlexColumnWidth(3),
                              3: FixedColumnWidth(60),
                              4: FlexColumnWidth(3.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  _buildHeaderCell('No'),
                                  _buildHeaderCell('Nama Barang'),
                                  _buildHeaderCell('Harga Barang'),
                                  _buildHeaderCell('Jml'),
                                  _buildHeaderCell('Subtotal'),
                                ],
                              ),
                              ...firstHutang.nama.isNotEmpty
                                  ? _buildItemRows(firstHutang)
                                  : [],
                              TableRow(
                                children: [
                                  _buildCell(''),
                                  _buildCell(''),
                                  _buildCell(''),
                                  _buildCell(
                                    'Total',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    alignment: TextAlign.right,
                                  ),
                                  _buildCell(
                                    currencyFormat
                                        .format(firstHutang.jumlahHutang),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (subHutangList.isNotEmpty) ...[
                            Text(
                              'Riwayat Cicilan',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 10),
                            Table(
                              border: TableBorder.all(),
                              columnWidths: const {
                                0: FixedColumnWidth(35),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(2),
                              },
                              children: [
                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('No'),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Tanggal'),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Jumlah'),
                                      ),
                                    ),
                                  ],
                                ),
                                ...subHutangList.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final cicilan = entry.value;
                                  return TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${index + 1}'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            DateFormat('dd/MM/yyyy')
                                                .format(cicilan.createAt),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            currencyFormat
                                                .format(cicilan.bayarCicilan),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                                // Total row
                                TableRow(
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(''),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Total Cicilan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          currencyFormat
                                              .format(totalBayarCicilan),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<HutangData>>(
          stream: _hutangStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const SizedBox.shrink();
            }

            final firstHutang = snapshot.data!.first;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  firstHutang.isPaid
                      ? 'Status: Lunas'
                      : 'Total Hutang: ${currencyFormat.format(_totalHutang)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: firstHutang.isPaid ? Colors.green : Colors.white,
                    fontWeight: firstHutang.isPaid
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                if (!firstHutang.isPaid)
                  ElevatedButton(
                    onPressed: () {
                      _showBayarDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Bayar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Rest of the methods remain the same
  Widget _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCell(String text, {TextStyle? style, TextAlign? alignment}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: style,
          textAlign: alignment ?? TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }

  List<TableRow> _buildItemRows(HutangData hutang) {
    final barangList = hutang.nama.split(', ');
    final hargaList = hutang.hargaBarang.split(', ');
    final jumlahList = hutang.jumlahBarang.split(', ');

    List<TableRow> rows = [];

    for (var i = 0; i < barangList.length; i++) {
      final subtotal = int.parse(hargaList[i]) * int.parse(jumlahList[i]);

      rows.add(TableRow(
        children: [
          _buildCell((i + 1).toString(), alignment: TextAlign.center),
          _buildCell(barangList[i].trim()),
          _buildCell(currencyFormat.format(int.parse(hargaList[i]))),
          _buildCell(numberFormat.format(int.parse(jumlahList[i])),
              alignment: TextAlign.center),
          _buildCell(currencyFormat.format(subtotal)),
        ],
      ));
    }

    return rows;
  }

  void _showBayarDialog(BuildContext context) {
    final TextEditingController bayarController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pembayaran'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Masukkan jumlah yang ingin dibayar:'),
              TextField(
                controller: bayarController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Pembayaran',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Total Hutang: ${currencyFormat.format(_totalHutang)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                bayarController.text = _totalHutang.toString();
              },
              child: const Text('Max'),
            ),
            ElevatedButton(
              onPressed: () async {
                final pembayaran = int.tryParse(bayarController.text);
                if (pembayaran != null &&
                    pembayaran > 0 &&
                    pembayaran <= _totalHutang) {
                  setState(() {
                    _totalHutang -= pembayaran;
                  });

                  try {
                    await database
                        .updateHutangPembayaran(
                      widget.hutangId,
                      pembayaran,
                    )
                        .then((_) async {
                      await database.insertLogPembayaran(
                          widget.hutangId, pembayaran);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Pembayaran berhasil diperbarui dan log ditambahkan')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Terjadi kesalahan: $error')),
                      );
                    });

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Pembayaran sebesar ${currencyFormat.format(pembayaran)} berhasil dilakukan',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Gagal melakukan pembayaran: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }

                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Jumlah pembayaran tidak valid'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Bayar'),
            ),
          ],
        );
      },
    );
  }
}
