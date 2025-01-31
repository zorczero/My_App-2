// DetailHutangPelanggan.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../popup/hutang_pelanggan.dart';

class DetailHutangPelanggan extends StatefulWidget {
  final Function onNavigateToHome;
  final Function onNavigateToHutang;
  final String customerName;
  final int pelangganId;
  final PelangganData pelanggan;

  const DetailHutangPelanggan({
    Key? key,
    required this.onNavigateToHome,
    required this.onNavigateToHutang,
    required this.customerName,
    required this.pelangganId,
    required this.pelanggan,
  }) : super(key: key);

  @override
  State<DetailHutangPelanggan> createState() => _DetailHutangPelangganState();
}

class _DetailHutangPelangganState extends State<DetailHutangPelanggan> {
  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  late AppDatabase _database;
  List<HutangData> _hutangList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _fetchHutangData();
  }

  Future<void> _fetchHutangData() async {
    try {
      final hutangList =
          await _database.getAllHutangByPelangganId(widget.pelangganId);
      setState(() {
        _hutangList = hutangList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching hutang data: $e')),
      );
    }
  }

  int getTotalHutang(List<HutangData> hutangList) {
    return _hutangList.fold(0, (sum, hutang) => sum + hutang.subJumlahHutang);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nama : ${widget.customerName} ${widget.pelanggan.isActive ? 'Pelanggan' : 'Sales'}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          StreamBuilder<List<HutangData>>(
            stream: _database.watchHutangByPelangganId(widget.pelangganId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text(
                  'Tidak ada data hutang.',
                  style: TextStyle(color: Colors.grey),
                );
              }

              final hutangList = snapshot.data!;
              final totalHutang = getTotalHutang(hutangList);

              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Hutang: ${currencyFormatter.format(totalHutang)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    Expanded(
                      child: ListView.builder(
                        itemCount: hutangList.length,
                        itemBuilder: (context, index) {
                          final hutang = hutangList[index];
                          return Card(
                            color: Colors.grey[800],
                            child: ListTile(
                              title: Text(
                                'Hutang #${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hutang Tanggal: ${DateFormat('dd/MM/yyyy').format(hutang.tanggalHutang)}',
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                  Text(
                                    hutang.tanggalJatuhTempo != null
                                        ? 'Jatuh Tempo: ${DateFormat('dd/MM/yyyy').format(hutang.tanggalJatuhTempo!)}'
                                        : 'Jatuh Tempo: Tidak ditentukan',
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              trailing: hutang.subJumlahHutang == 0
                                  ? const Text(
                                      'Lunas',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Text(
                                      currencyFormatter
                                          .format(hutang.subJumlahHutang),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HutangPelanggan(
                                      customerName: widget.customerName,
                                      hutangId: hutang.id,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
