import 'package:flutter/material.dart';

import '../database/database.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _formKey = GlobalKey<FormState>();
  final database = AppDatabase();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _kodeController.dispose();
    _modalController.dispose();
    _hargaController.dispose();
    _stockController.dispose();
    database.close();
    super.dispose();
  }

  Future<void> insert(String namaBarang, String kodeBarang, int modalBarang,
      int hargaJualBarang, int stockBarang, int type) async {
    DateTime now = DateTime.now();

    final row = await database.into(database.barang).insert(
          BarangCompanion.insert(
            name: namaBarang,
            kode: kodeBarang,
            modal: modalBarang,
            harga_jual: hargaJualBarang,
            stock: stockBarang,
            type: type,
            createdAt: now,
            updatedAt: now,
          ),
        );
    print("Data berhasil dimasukkan dengan ID: " + row.toString());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      int type = 2;

      insert(
        _namaController.text,
        _kodeController.text,
        int.parse(_modalController.text),
        int.parse(_hargaController.text),
        int.parse(_stockController.text),
        type,
      ).then((_) {
        _namaController.clear();
        _kodeController.clear();
        _modalController.clear();
        _hargaController.clear();
        _stockController.clear();

        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Daftar Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    labelText: 'Nama Barang',
                    hintText: 'Masukan Nama Barang',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Barang tidak boleh kosong';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _kodeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    labelText: 'Kode Barang',
                    hintText: 'Masukan Kode Barang',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kode Barang tidak boleh kosong';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _modalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    labelText: 'Modal Barang',
                    hintText: 'Masukan Modal Barang',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Modal Barang tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Modal Barang harus berupa angka';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    labelText: 'Harga Jual',
                    hintText: 'Masukan Harga Jual',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga Jual tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Harga Jual harus berupa angka';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _stockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    labelText: 'Stock Barang',
                    hintText: 'Masukan Stock Barang',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock Barang tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Stock Barang harus berupa angka';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
