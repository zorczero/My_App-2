import 'package:flutter/material.dart';
import 'package:aplikasi/database/database.dart';
import '../details/detail_transaksi.dart';
import 'package:intl/intl.dart';

class SearchDelegateScreen1 extends SearchDelegate<String> {
  final AppDatabase database;

  SearchDelegateScreen1(this.database);

  Future<List<TransaksiData>> _getTransactions() async {
    return await database.watchAllTransactions().first;
  }

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    final DateFormat dateFormat = DateFormat('EEEE, d MMMM y');
    return dateFormat.format(dateTime);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<TransaksiData>>(
      future: _getTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching customer names'));
        } else {
          final List<TransaksiData> results = snapshot.data!
              .where((transaksi) =>
                  transaksi.customerName != null &&
                  transaksi.customerName!.isNotEmpty &&
                  transaksi.customerName!
                      .toLowerCase()
                      .contains(query.toLowerCase()))
              .toList();

          return ListView(
            children: results
                .map((result) => ListTile(
                      title: Text(
                          '${result.customerName!} (${result.id})'), // Format nama dan ID
                      subtitle: Text(_formatDate(result.createdAt)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailTransaksi(
                              transactionId: result.id,
                              customerName: result.customerName.toString(),
                            ),
                          ),
                        );
                      },
                    ))
                .toList(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<TransaksiData>>(
      future: _getTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching customer names'));
        } else {
          final List<TransaksiData> suggestions = snapshot.data!
              .where((transaksi) =>
                  transaksi.customerName != null &&
                  transaksi.customerName!.isNotEmpty &&
                  transaksi.customerName!
                      .toLowerCase()
                      .startsWith(query.toLowerCase()))
              .toList();

          return ListView(
            children: suggestions
                .map((suggestion) => ListTile(
                      title: Text(
                          '${suggestion.customerName!} (${suggestion.id})'), // Format nama dan ID
                      subtitle: Text(_formatDate(suggestion.createdAt)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailTransaksi(
                              transactionId: suggestion.id,
                              customerName: suggestion.customerName.toString(),
                            ),
                          ),
                        );
                      },
                    ))
                .toList(),
          );
        }
      },
    );
  }
}
