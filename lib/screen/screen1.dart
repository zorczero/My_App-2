import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../popup/transaction_card.dart';
import '../provider/transaction_provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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

  Widget _buildCardContent(int selectedIndex) {
    return StreamBuilder<List<TransaksiData>>(
      stream: _getTransactionStream(selectedIndex),
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

        transactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionCard(
              transaction: transaction,
              isPaid: transaction.isPaid,
              namaCustomer: transaction.customerName.toString(),
            );
          },
        );
      },
    );
  }

  Stream<List<TransaksiData>> _getTransactionStream(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return database.watchHutangTransactions();
      case 2:
        return database.watchLunasTransactions();
      default:
        return database.watchAllTransactions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, transactionProvider, _) {
        final selectedIndex = transactionProvider.selectedIndex;

        return Scaffold(
          body: Column(
            children: [
              Container(
                color: const Color(0xFF004D40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    final item = transactionProvider.navItems[index];
                    return GestureDetector(
                      onTap: () => transactionProvider.navigateTo(index),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        color: selectedIndex == index
                            ? Colors.tealAccent.withOpacity(0.2)
                            : Colors.transparent,
                        child: Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedIndex == index
                                ? Colors.tealAccent
                                : Colors.white,
                            fontWeight: selectedIndex == index
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
                child: _buildCardContent(selectedIndex),
              ),
            ],
          ),
        );
      },
    );
  }
}
