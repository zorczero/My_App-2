import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../provider/navbar_provider.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final database = AppDatabase();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _namaController.dispose();
    _kodeController.dispose();
    _modalController.dispose();
    _hargaController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<bool> insert(String namaBarang, String kodeBarang, int modalBarang,
      int hargaJualBarang, int stockBarang, int type) async {
    DateTime now = DateTime.now();
    try {
      final entry = BarangCompanion.insert(
        name: namaBarang,
        kode: kodeBarang,
        modal: modalBarang,
        harga_jual: hargaJualBarang,
        stock: stockBarang,
        type: type,
        createdAt: now,
        updatedAt: now,
      );

      await database.insertBarang(entry);
      return true;
    } catch (e) {
      print("Error saat menyimpan data: ${e.toString()}");
      return false;
    }
  }

  void _clearForm() {
    _namaController.clear();
    _kodeController.clear();
    _modalController.clear();
    _hargaController.clear();
    _stockController.clear();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final success = await insert(
          _namaController.text,
          _kodeController.text,
          int.tryParse(_modalController.text) ?? 0,
          int.tryParse(_hargaController.text) ?? 0,
          int.tryParse(_stockController.text) ?? 0,
          2,
        );

        if (success) {
          final navbarProvider =
              Provider.of<NavbarProvider>(context, listen: false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data berhasil disimpan')),
          );
          _clearForm();

          navbarProvider.navigateTo(1);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal menyimpan data')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Daftar Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navbarProvider.navigateTo(1);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      controller: _namaController,
                      label: 'Nama Barang',
                      hint: 'Masukkan Nama Barang',
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: _kodeController,
                      label: 'Kode Barang',
                      hint: 'Masukkan Kode Barang',
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: _modalController,
                      label: 'Modal Barang',
                      hint: 'Masukkan Modal Barang',
                      isNumber: true,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: _hargaController,
                      label: 'Harga Jual',
                      hint: 'Masukkan Harga Jual',
                      isNumber: true,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: _stockController,
                      label: 'Stock Barang',
                      hint: 'Masukkan Stock Barang',
                      isNumber: true,
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitForm,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: (value) =>
          value == null || value.isEmpty ? '$label tidak boleh kosong' : null,
    );
  }
}
