import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../Pembukuan/hutang_toko.dart';
import '../database/database.dart';

class InputHutangToko extends StatefulWidget {
  const InputHutangToko({super.key});

  @override
  State<InputHutangToko> createState() => _InputHutangTokoState();
}

class _InputHutangTokoState extends State<InputHutangToko> {
  late final AppDatabase database;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaTokoController = TextEditingController();
  final TextEditingController _jatuhTempoController = TextEditingController();
  DateTime _jatuhTempo = DateTime.now();
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    _jatuhTempoController.text =
        intl.DateFormat('dd/MM/yyyy').format(_jatuhTempo);
  }

  @override
  void dispose() {
    database.close();
    _namaTokoController.dispose();
    _jatuhTempoController.dispose();
    super.dispose();
  }

  Future<void> _insert(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final name = _namaTokoController.text.trim();
      if (name.isEmpty) {
        throw Exception("Nama Toko tidak boleh kosong");
      }

      final row = await database
          .into(database.hutangTokoKM)
          .insertReturning(HutangTokoKMCompanion.insert(
            namaToko: name,
            jatuhTempo: _jatuhTempo,
            createdAt: now,
          ));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil disimpan'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HutangToko()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan data: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _jatuhTempo,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _jatuhTempo) {
      setState(() {
        _jatuhTempo = pickedDate;
        _jatuhTempoController.text =
            intl.DateFormat('dd/MM/yyyy').format(_jatuhTempo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Hutang Toko'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaTokoController,
                decoration: InputDecoration(
                  labelText: 'Hutang Kepada:',
                  labelStyle: const TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama Toko tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _jatuhTempoController,
                    decoration: InputDecoration(
                      labelText: 'Jatuh Tempo',
                      labelStyle: const TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal jatuh tempo tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _insert(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
