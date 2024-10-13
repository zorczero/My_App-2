import 'package:flutter/material.dart';
import '../database/database.dart';
import 'package:drift/drift.dart' hide Column;

class EditStock extends StatefulWidget {
  const EditStock({super.key});

  @override
  State<EditStock> createState() => _EditStockState();
}

class _EditStockState extends State<EditStock> {
  late AppDatabase database;
  List<TextEditingController> _stockControllers = [];
  List<BarangData> _items = [];

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await database.getAllBarang();
    setState(() {
      _stockControllers = List.generate(
        _items.length,
        (index) => TextEditingController(text: _items[index].stock.toString()),
      );
    });
  }

  Future<void> _updateStock() async {
    for (int i = 0; i < _items.length; i++) {
      final newStock = int.tryParse(_stockControllers[i].text);
      if (newStock != null && newStock != _items[i].stock) {
        await database.updateBarang(
          _items[i].id,
          BarangCompanion(
            stock: Value(newStock),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    }
    // Reload items after update
    await _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Stock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _items.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Barang: ${_items[index].name}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _stockControllers[index],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Masukkan Jumlah Stok',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _updateStock();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Stok berhasil disimpan'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 50),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _stockControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

// Add this method to your AppDatabase class
extension AppDatabaseBarangMethods on AppDatabase {
  Future<void> updateBarang(int id, BarangCompanion barang) async {
    await (update(this.barang)..where((tbl) => tbl.id.equals(id)))
        .write(barang);
  }
}
