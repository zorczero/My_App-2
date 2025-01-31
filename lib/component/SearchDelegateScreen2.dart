import 'package:flutter/material.dart';
import '../database/database.dart';
import '../details/detail_barang.dart';

class SearchDelegateScreen2 extends SearchDelegate<String> {
  final AppDatabase _database;

  SearchDelegateScreen2(this._database);

  Future<List<String>> _fetchData() async {
    return await _database.getAllItemNames();
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
    return FutureBuilder<List<String>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No results found.'));
        } else {
          final List<String> results = snapshot.data!
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return ListView(
            children: results
                .map((result) => ListTile(
                      title: Text(result),
                      onTap: () {
                        Navigator.pop(context, result);
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
    return FutureBuilder<List<String>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No suggestions found.'));
        } else {
          final List<String> suggestions = snapshot.data!
              .where(
                  (item) => item.toLowerCase().startsWith(query.toLowerCase()))
              .toList();

          return ListView(
            children: suggestions
                .map((suggestion) => ListTile(
                      title: Text(suggestion),
                      onTap: () async {
                        final itemDetails =
                            await _database.getItemDetails(suggestion);

                        if (itemDetails != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailBarang(
                                itemDetails: itemDetails,
                              ),
                            ),
                          );
                        }
                      },
                    ))
                .toList(),
          );
        }
      },
    );
  }
}
