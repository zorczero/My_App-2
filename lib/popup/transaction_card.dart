import 'package:aplikasi/details/detail_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../popup/hutang_pelanggan.dart';

class TransactionCard extends StatefulWidget {
  final TransaksiData transaction;
  final String namaCustomer;
  final bool isPaid;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.isPaid,
    required this.namaCustomer,
  });

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  late AppDatabase _database;
  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PelangganData>>(
      stream:
          _database.watchPelangganBerdasarkanCustomerName(widget.namaCustomer),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasError) {
          return _buildErrorCard('Error: ${streamSnapshot.error}');
        }

        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingCard();
        }

        final pelangganList = streamSnapshot.data ?? [];

        if (pelangganList.isEmpty) {
          return Card(
            margin: const EdgeInsets.all(8),
            color: widget.isPaid
                ? const Color(0xFF1B5E20)
                : const Color(0xFFB71C1C),
            child: ListTile(
              leading: Icon(
                widget.isPaid ? Icons.credit_card : Icons.money_off,
                color: Colors.white,
              ),
              title: Text(
                'Name: - #${widget.transaction.id}',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal: ${DateFormat('dd/MM/yyyy').format(widget.transaction.createdAt)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'Total: Rp. ${NumberFormat('#,##0', 'id_ID').format(widget.transaction.totalHarga)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailTransaksi(
                        transactionId: widget.transaction.id,
                        customerName: widget.namaCustomer,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }

        return FutureBuilder<List<HutangData>>(
          future: _database
              .getHutangById(widget.transaction.transactionHutangId ?? 0),
          builder: (context, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingCard();
            }

            if (futureSnapshot.hasError) {
              return _buildErrorCard('Error: ${futureSnapshot.error}');
            }

            final hutangList = futureSnapshot.data ?? [];
            final firstHutang = hutangList.first;

            if (hutangList.isEmpty) {
              return _buildErrorCard('Tidak ada hutang untuk pelanggan ini');
            }

            return Card(
              margin: const EdgeInsets.all(8),
              color: firstHutang.isPaid
                  ? const Color(0xFF1B5E20)
                  : const Color(0xFFB71C1C),
              child: ListTile(
                leading: Icon(
                  firstHutang.isPaid ? Icons.credit_card : Icons.money_off,
                  color: Colors.white,
                ),
                title: Text(
                  'Nama: ${widget.transaction.customerName} #${widget.transaction.id}',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal: ${DateFormat('dd/MM/yyyy').format(firstHutang.createAt)}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      firstHutang.subJumlahHutang == 0
                          ? 'Status: Lunas'
                          : 'Total: Rp. ${NumberFormat('#,##0', 'id_ID').format(firstHutang.subJumlahHutang)}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {
                    if (widget.isPaid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTransaksi(
                            transactionId: widget.transaction.id,
                            customerName: widget.namaCustomer,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HutangPelanggan(
                            hutangId:
                                widget.transaction.transactionHutangId ?? 0,
                            customerName: widget.namaCustomer,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLoadingCard() {
    return const Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildErrorCard(String errorMessage) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(errorMessage),
      ),
    );
  }
}
