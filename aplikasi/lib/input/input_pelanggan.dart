import 'package:flutter/material.dart';
import '../component/search_barang.dart';
import '../database/database.dart';
import 'package:drift/drift.dart' as drift;

class InputPelanggan extends StatefulWidget {
  const InputPelanggan({super.key});

  @override
  State<InputPelanggan> createState() => _InputPelangganState();
}

class _InputPelangganState extends State<InputPelanggan> {
  final _namaController = TextEditingController();
  final List<String> _selectedItems = [];
  final Set<String> _excludedItems = Set<String>();
  final Map<String, TextEditingController> _hargaControllers = {};
  final _database = AppDatabase(); // Singleton instance

  @override
  void dispose() {
    _namaController.dispose();
    for (var controller in _hargaControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemSelected(String itemName) {
    setState(() {
      _selectedItems.add(itemName);
      _excludedItems.add(itemName);
      _hargaControllers[itemName] = TextEditingController();
    });
  }

  void _saveData() async {
    bool allPricesFilled = true;

    for (var itemName in _selectedItems) {
      final harga = _hargaControllers[itemName]?.text ?? '';

      if (harga.isEmpty || double.tryParse(harga) == null) {
        allPricesFilled = false;
        break;
      }
    }

    if (!allPricesFilled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data error')),
      );
    } else {
      final namaPelanggan = _namaController.text;
      if (namaPelanggan.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data error')),
        );
        return;
      }

      try {
        final pelangganId = await _insertPelanggan(namaPelanggan);
        double totalHutang = 0;

        for (var itemName in _selectedItems) {
          final harga = double.parse(_hargaControllers[itemName]?.text ?? '0');
          await _insertBarangPelanggan(pelangganId, itemName, harga);
          totalHutang += harga;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil dimasukkan')),
        );

        // Reset input setelah menyimpan
        setState(() {
          _namaController.clear();
          _selectedItems.clear();
          _hargaControllers.clear();
          _excludedItems.clear();
        });

        // Kembali ke menu awal
        Navigator.pop(context); // Ini akan kembali ke layar sebelumnya
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data error')),
        );
      }
    }
  }

  Future<int> _insertPelanggan(String nama) async {
    final id = await _database.into(_database.pelanggan).insert(
          PelangganCompanion(
            nama: drift.Value(nama),
          ),
        );
    return id;
  }

  Future<void> _insertBarangPelanggan(
      int pelangganId, String namaBarang, double harga) async {
    await _database.into(_database.barangPelanggan).insert(
          BarangPelangganCompanion(
            pelangganId: drift.Value(pelangganId),
            namaBarang: drift.Value(namaBarang),
            harga: drift.Value(harga),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Pelanggan',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Masukkan nama pelanggan',
                labelText: 'Nama',
                prefixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedItems.length,
                itemBuilder: (context, index) {
                  final itemName = _selectedItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        itemName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: TextField(
                        controller: _hargaControllers[itemName],
                        decoration: const InputDecoration(
                          hintText: 'Masukkan harga barang',
                          prefixText: 'Rp. ',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputBarang(
                          onItemSelected: _onItemSelected,
                          excludedItems: _excludedItems.toList(),
                        ),
                      ),
                    );
                  },
                  child: const Text('Tambahkan Barang dan harga'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.save, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Simpan',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
