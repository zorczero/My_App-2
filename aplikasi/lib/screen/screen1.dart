import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan import ini
import '../database/database.dart';
import '../details/detail_transaksi.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _selectedIndex = 0;
  late AppDatabase database;

  final List<String> _options = ['Home', 'Hutang', 'Lunas'];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCardContent() {
    return StreamBuilder<List<TransaksiData>>(
      stream: _getTransactionStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final transactions = snapshot.data ?? [];
        if (transactions.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada transaksi.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        }
        final groupedTransactions = groupTransactions(transactions);
        return ListView.builder(
          itemCount: groupedTransactions.length,
          itemBuilder: (context, index) {
            final transactionGroup = groupedTransactions[index];
            final firstTransaction = transactionGroup.first;
            return Card(
              margin: const EdgeInsets.all(8),
              color: firstTransaction.isPaid
                  ? const Color(0xFF1B5E20)
                  : const Color(0xFFB71C1C),
              child: ListTile(
                leading: Icon(
                  firstTransaction.isPaid ? Icons.credit_card : Icons.money_off,
                  color: Colors.white,
                ),
                title: Text(
                  firstTransaction.customerName?.isNotEmpty == true
                      ? firstTransaction.customerName!
                      : 'Name: -',
                ),
                subtitle: Text(
                    'Total: Rp. ${NumberFormat('#,##0', 'id_ID').format(firstTransaction.totalHarga)}'),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTransaksi(
                          transactionId: firstTransaction.id,
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
          },
        );
      },
    );
  }

  Stream<List<TransaksiData>> _getTransactionStream() {
    switch (_selectedIndex) {
      case 1: // Hutang
        return database.watchHutangTransactions();
      case 2: // Lunas
        return database.watchLunasTransactions();
      default: // Home
        return database.watchAllTransactions();
    }
  }

  List<List<TransaksiData>> groupTransactions(
      List<TransaksiData> transactions) {
    Map<int, List<TransaksiData>> groups = {};
    for (var transaction in transactions) {
      if (!groups.containsKey(transaction.id)) {
        groups[transaction.id] = [];
      }
      groups[transaction.id]!.add(transaction);
    }
    return groups.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF004D40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_options.length, (index) {
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    color: _selectedIndex == index
                        ? Colors.tealAccent.withOpacity(0.2)
                        : Colors.transparent,
                    child: Text(
                      _options[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: _selectedIndex == index
                            ? Colors.tealAccent
                            : Colors.white,
                        fontWeight: _selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: _buildCardContent(),
          ),
        ],
      ),
    );
  }
}
