import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:aplikasi/database/database.dart';

class EditPelanggan extends StatefulWidget {
  final int pelangganId;

  const EditPelanggan({super.key, required this.pelangganId});

  @override
  State<EditPelanggan> createState() => _EditPelangganState();
}

class _EditPelangganState extends State<EditPelanggan> {
  late AppDatabase _database;
  List<BarangPelangganData> _barangList = [];
  final Map<String, TextEditingController> _hargaControllers = {};

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _fetchBarangPelangganData();
  }

  Future<void> _fetchBarangPelangganData() async {
    _database.pelangganDao
        .watchBarangByPelangganId(widget.pelangganId)
        .listen((barangList) {
      setState(() {
        _barangList = barangList;
        _hargaControllers.clear();
        for (var barang in barangList) {
          _hargaControllers[barang.namaBarang] =
              TextEditingController(text: barang.harga.toString());
        }
      });
    });
  }

  void _saveChanges() async {
    for (var barang in _barangList) {
      final harga =
          double.tryParse(_hargaControllers[barang.namaBarang]?.text ?? '') ??
              0.0;

      // Only update if price has changed
      if (harga != barang.harga) {
        await _database.pelangganDao.updateBarangPelanggan(
          BarangPelangganCompanion(
            id: drift.Value(barang.id),
            pelangganId: drift.Value(widget.pelangganId),
            namaBarang: drift.Value(barang.namaBarang),
            harga: drift.Value(harga),
          ),
        );
      }
    }

    // Insert new items
    for (var barang in _barangList) {
      if (barang.id == 0) {
        await _database.pelangganDao.insertBarangPelanggan(
          BarangPelangganCompanion(
            pelangganId: drift.Value(widget.pelangganId),
            namaBarang: drift.Value(barang.namaBarang),
            harga: drift.Value(barang.harga),
          ),
        );
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan disimpan')),
    );

    Navigator.of(context).pop();
  }

  void _addBarang() async {
    final allBarang = await _database.getAllBarang();

    // Filter barang yang sudah ada
    final availableBarang = allBarang.where((barang) {
      return !_barangList.any((b) => b.namaBarang == barang.name);
    }).toList();

    if (availableBarang.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Tidak ada barang baru'),
          content: const Text('Semua barang sudah ditambahkan.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        String? selectedBarang;
        double? newHarga;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Tambah Barang'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    hint: const Text('Pilih Barang'),
                    value: selectedBarang,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBarang = newValue;
                      });
                    },
                    items:
                        availableBarang.map<DropdownMenuItem<String>>((barang) {
                      return DropdownMenuItem<String>(
                        value: barang.name,
                        child: Text(barang.name),
                      );
                    }).toList(),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Harga Barang'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      newHarga = double.tryParse(value);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (selectedBarang != null && newHarga != null) {
                      final newBarang = BarangPelangganData(
                        id: 0,
                        pelangganId: widget.pelangganId,
                        namaBarang: selectedBarang!,
                        harga: newHarga!,
                      );

                      setState(() {
                        _barangList.add(newBarang);
                        _hargaControllers[selectedBarang!] =
                            TextEditingController(text: newHarga.toString());
                      });

                      // Simpan barang baru ke database
                      await _database.pelangganDao.insertBarangPelanggan(
                        BarangPelangganCompanion(
                          pelangganId: drift.Value(widget.pelangganId),
                          namaBarang: drift.Value(newBarang.namaBarang),
                          harga: drift.Value(newBarang.harga),
                        ),
                      );
                      Navigator.of(context).pop();
                    } else {
                      // Show error message for invalid input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Input tidak valid')),
                      );
                    }
                  },
                  child: const Text('Tambah'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Batal'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _hargaControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pelanggan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _barangList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _barangList.length,
                    itemBuilder: (context, index) {
                      final barang = _barangList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(
                            barang.namaBarang,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: TextField(
                            controller: _hargaControllers[barang.namaBarang],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _addBarang,
                  child: const Text('Tambah Barang'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(120, 0),
                  ),
                ),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: const Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(120, 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
