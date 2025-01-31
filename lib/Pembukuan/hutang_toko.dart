import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../input/input_hutangToko.dart';

class HutangToko extends StatefulWidget {
  const HutangToko({Key? key}) : super(key: key);

  @override
  State<HutangToko> createState() => _HutangTokoState();
}

class _HutangTokoState extends State<HutangToko> {
  late AppDatabase database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  Future<void> _initializeDatabase() async {
    database = AppDatabase();
    setState(() {});
  }

  // Format tanggal hanya dengan tanggal
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _deleteHutangToko(int id) async {
    await database.deleteHutangToko(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MANAJEMEN'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: StreamBuilder<List<HutangTokoKMData>>(
        stream: database.watchAllHutangTokoKM(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Terjadi kesalahan: ${snapshot.error}'),
            );
          }
          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const Center(child: Text('Belum ada data hutang toko.'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Dismissible(
                key: Key(item.id.toString()),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _deleteHutangToko(item.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.namaToko} telah dihapus'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: ListTile(
                  leading: const Icon(Icons.local_offer, color: Colors.teal),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.namaToko),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Tanggal: ${formatDate(item.createdAt)}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Jatuh Tempo: ${formatDate(item.jatuhTempo)}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => _showUpdateDialog(context, item),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputHutangToko()),
          );
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Tambah Hutang Toko',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Future<void> _showUpdateDialog(
      BuildContext context, HutangTokoKMData item) async {
    final TextEditingController namaTokoController =
        TextEditingController(text: item.namaToko);
    final TextEditingController jatuhTempoController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(item.jatuhTempo),
    );
    DateTime selectedDate = item.jatuhTempo;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Hutang Toko'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaTokoController,
              decoration: const InputDecoration(labelText: 'Nama Toko'),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  selectedDate = picked;
                  jatuhTempoController.text =
                      DateFormat('dd/MM/yyyy').format(picked);
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: jatuhTempoController,
                  decoration: const InputDecoration(
                    labelText: 'Jatuh Tempo',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              await database.updateHutangToko(
                item.id,
                namaTokoController.text,
                selectedDate,
              );
              if (!context.mounted) return;
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data berhasil diperbarui'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
