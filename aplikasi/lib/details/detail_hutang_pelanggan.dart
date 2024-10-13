import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';

class DetailHutangPelanggan extends StatefulWidget {
  final Function onNavigateToHome;
  final Function onNavigateToHutang;
  final String customerName;
  final int pelangganId;

  const DetailHutangPelanggan({
    Key? key,
    required this.onNavigateToHome,
    required this.onNavigateToHutang,
    required this.customerName,
    required this.pelangganId,
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

  int getTotalHutang() {
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
          _isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.red[900],
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Nama Pelanggan: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      widget.customerName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Total Hutang: ${currencyFormatter.format(getTotalHutang())}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _hutangList.length,
                          itemBuilder: (context, index) {
                            final hutang = _hutangList[index];
                            return Card(
                              color: Colors.grey[800],
                              child: ListTile(
                                title: Text(
                                  'Hutang #${hutang.id}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Tanggal: ${DateFormat('dd/MM/yyyy').format(hutang.tanggalHutang)}',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: Text(
                                  currencyFormatter
                                      .format(hutang.subJumlahHutang),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
