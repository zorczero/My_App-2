import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';

class JatuhTempo extends StatefulWidget {
  const JatuhTempo({Key? key}) : super(key: key);

  @override
  State<JatuhTempo> createState() => _JatuhTempoState();
}

class _JatuhTempoState extends State<JatuhTempo> {
  late AppDatabase database;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  String _getCurrentDate() => DateFormat('dd MMMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jatuh Tempo')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tanggal: ${_getCurrentDate()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TransaksiData>>(
              stream: database.watchOverdueTransactions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final overdueTransactions = snapshot.data ?? [];
                if (overdueTransactions.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada transaksi yang jatuh tempo.',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: overdueTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = overdueTransactions[index];
                    return _buildCard(transaction);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(TransaksiData transaction) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.money_off),
            title: Text(transaction.customerName ?? 'Unnamed Customer'),
            subtitle: Text('Jatuh Tempo: ${_formatDate(transaction.dueDate)}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _showConfirmationDialog(context, transaction),
                child: const Text('LUNAS'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Tanggal tidak tersedia';
    return DateFormat('dd MMMM yyyy').format(date);
  }

  void _showConfirmationDialog(
      BuildContext context, TransaksiData transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text(
              'Apakah Anda yakin ingin menandai "${transaction.customerName ?? 'Unnamed Customer'}" sebagai lunas?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('BATAL'),
            ),
            TextButton(
              onPressed: () {
                _markAsPaid(transaction);
                Navigator.of(context).pop();
              },
              child: const Text('YA'),
            ),
          ],
        );
      },
    );
  }

  void _markAsPaid(TransaksiData transaction) async {
    try {
      await database.updateTransactionPaidStatus(transaction.id, true);
      _showSuccessMessage(context);
    } catch (e) {
      _showErrorMessage(context, 'Failed to update transaction: $e');
    }
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Status lunas telah dikonfirmasi!')),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
