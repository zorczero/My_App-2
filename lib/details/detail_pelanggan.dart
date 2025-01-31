import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../database/pelangganDao.dart';
import '../edit/edit_pelanggan.dart';
import 'detail_home_pelanggan.dart';
import 'detail_hutang_pelanggan.dart';

class DetailPelanggan extends StatefulWidget {
  final PelangganData pelanggan;

  const DetailPelanggan({Key? key, required this.pelanggan}) : super(key: key);

  @override
  State<DetailPelanggan> createState() => _DetailPelangganState();
}

class _DetailPelangganState extends State<DetailPelanggan> {
  late AppDatabase _database;
  late PelangganDao _pelangganDao;
  List<BarangPelangganData> _barangList = [];
  bool _isLoading = true;
  int _currentPage = 0;

  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
  );

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _pelangganDao = _database.pelangganDao;
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final barangList =
          await _pelangganDao.getBarangByPelangganId(widget.pelanggan.id);

      setState(() {
        _barangList = barangList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  void _navigateToHome() {
    setState(() {
      _currentPage = 0;
    });
  }

  void _navigateToHutang() {
    setState(() {
      _currentPage = 1;
    });
  }

  void _navigateToEdit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPelanggan(pelangganId: widget.pelanggan.id),
      ),
    ).then((_) => _fetchData());
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (_currentPage) {
      case 0:
        page = _isLoading
            ? const Center(child: CircularProgressIndicator())
            : DetailHomePelanggan(
                pelanggan: widget.pelanggan,
                barangList: _barangList,
                currencyFormatter: currencyFormatter,
                onNavigateToHome: _navigateToHome,
                onNavigateToHutang: _navigateToHutang,
              );
        break;
      case 1:
        page = DetailHutangPelanggan(
          onNavigateToHome: _navigateToHome,
          onNavigateToHutang: _navigateToHutang,
          customerName: widget.pelanggan.nama,
          pelangganId: widget.pelanggan.id,
          pelanggan: widget.pelanggan,
        );
        break;
      default:
        page = const SizedBox();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pelanggan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: _navigateToEdit,
          ),
        ],
      ),
      body: page,
      backgroundColor: Colors.grey[900],
    );
  }
}
