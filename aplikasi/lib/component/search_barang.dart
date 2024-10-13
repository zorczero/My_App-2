import 'package:flutter/material.dart';
import '../database/database.dart';

class InputBarang extends StatefulWidget {
  final void Function(String)? onItemSelected;
  final List<String> excludedItems;

  const InputBarang({
    super.key,
    this.onItemSelected,
    required this.excludedItems,
  });

  @override
  _InputBarangState createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  String _searchQuery = '';
  final database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahkan Barang & harga?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Cari Barang',
                hintText: 'Masukkan nama barang',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterItems,
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama Barang:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // StreamBuilder to listen for changes in data
            Expanded(
              child: StreamBuilder<List<BarangData>>(
                stream: database.watchAllBarang(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No items found'));
                  }

                  final items = snapshot.data!;

                  // Filter items based on search query
                  final filteredItems = items.where((item) {
                    return !widget.excludedItems.contains(item.name) &&
                        item.name
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase());
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text(item.name),
                        onTap: () {
                          // Call the callback with the selected item name
                          if (widget.onItemSelected != null) {
                            widget.onItemSelected!(item.name);
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
    });
  }
}
