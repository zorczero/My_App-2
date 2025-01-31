import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../component/search_nama_pelanggan.dart';
import '../component/search_page.dart';
import '../database/database.dart';
import 'package:drift/drift.dart' as drift;
import '../database/pelangganDao.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../provider/navbar_provider.dart';

class InputTransaction extends StatefulWidget {
  InputTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  bool isPaid = false;
  DateTime? dueDate;
  List<int> quantities = [];
  List<String> selectedItems = [];
  List<int> selectedPrices = [];
  List<TextEditingController> priceControllers = [];
  final database = AppDatabase();
  final PelangganDao _pelangganDao = PelangganDao(AppDatabase());
  String? selectedCustomer;

  @override
  void dispose() {
    for (var controller in priceControllers) {
      controller.dispose();
    }
    database.close();
    super.dispose();
  }

  void _showPaymentDialog() {
    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan masukkan data transaksi terlebih dahulu'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Status Pembayaran'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: Text(isPaid ? 'Lunas' : 'Hutang'),
                    value: isPaid,
                    onChanged: (bool value) {
                      setState(() {
                        isPaid = value;
                        if (!isPaid) {
                          dueDate = null;
                        }
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                  ),
                  if (!isPaid)
                    Column(
                      children: [
                        Text(
                          dueDate != null
                              ? 'Jatuh Tempo: ${dueDate!.toLocal().toString().split(' ')[0]}'
                              : 'Pilih Jatuh Tempo',
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );

                            if (selectedDate != null &&
                                selectedDate != dueDate) {
                              setState(() {
                                dueDate = selectedDate;
                              });
                            }
                          },
                          child: const Text('Pilih Tanggal'),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
            ElevatedButton(
              onPressed: () async {
                final navbarProvider =
                    Provider.of<NavbarProvider>(context, listen: false);

                await insertTransaction();
                navbarProvider.navigateTo(0);
                Navigator.of(context).pop();
              },
              child: const Text('Bayar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> insertTransaction() async {
    final String barangStr = selectedItems.join(', ');
    final String pricesStr = selectedPrices.join(', ');
    final String quantitiesStr = quantities.join(', ');
    final int totalHarga = getTotalPrice();
    DateTime now = DateTime.now();

    drift.Value<int?> transactionHutangId;
    if (selectedCustomer == null && isPaid == true) {
      transactionHutangId = const drift.Value.absent();
    } else if (selectedCustomer == null) {
      transactionHutangId = const drift.Value.absent();
    } else if (isPaid == true) {
      transactionHutangId = const drift.Value.absent();
    } else {
      final latestId = await database.getLatestTransactionIds() ?? 0;
      transactionHutangId = drift.Value(latestId + 1);
    }

    try {
      final transactionData = TransaksiCompanion.insert(
        transactionHutangId: transactionHutangId,
        barang: barangStr,
        hargaBarang: pricesStr,
        jumlahBarang: quantitiesStr,
        totalHarga: totalHarga,
        subTotalHarga: totalHarga,
        customerName: drift.Value(selectedCustomer ?? ''),
        isPaid: isPaid,
        dueDate: drift.Value(dueDate),
        createdAt: drift.Value(now),
      );

      // Print transaction data before inserting
      print('===== TRANSACTION DATA =====');
      print('transactionHutangId: $transactionHutangId');
      print('isPaid: $isPaid');
      print('customerName: ${selectedCustomer ?? 'No customer selected'}');

      // Insert transaksi ke tabel transaksi
      final insertedTransaction = await database
          .into(database.transaksi)
          .insertReturning(transactionData);

      if (selectedCustomer != null) {
        final pelanggan =
            await _pelangganDao.getPelangganByName(selectedCustomer!);

        if (pelanggan != null) {
          if (!isPaid) {
            // Add new debt record
            final hutangData = HutangCompanion.insert(
              pelangganId: pelanggan.id,
              jumlahHutang: totalHarga,
              tanggalHutang: now,
              subJumlahHutang: totalHarga,
              tanggalJatuhTempo: drift.Value(dueDate),
              isPaid: isPaid,
              nama: barangStr,
              hargaBarang: pricesStr,
              jumlahBarang: quantitiesStr,
            );

            // Insert the new debt record
            final insertedHutang = await database
                .into(database.hutang)
                .insertReturning(hutangData);
          } else {
            final existingHutang = await (database.select(database.hutang)
                  ..where((h) => h.pelangganId.equals(pelanggan.id)))
                .get();

            int remainingDebt = totalHarga;
            for (var hutang in existingHutang) {
              if (remainingDebt <= 0) break;

              int reduction = min(hutang.subJumlahHutang, remainingDebt);

              remainingDebt -= reduction;
            }

            if (remainingDebt > 0) {
              print(
                  'Warning: Paid amount exceeds total debt by $remainingDebt');
            }
          }
        } else {
          print('Customer not found: $selectedCustomer');
        }
      }
      print('===== TRANSACTION PROCESSING COMPLETED =====');
    } catch (e) {
      // Print error message if the transaction fails
      print('===== ERROR INSERTING TRANSACTION =====');
      print('Error: $e');
    }
  }

  void _increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 0) {
        quantities[index]--;
      }
    });
  }

  Future<void> _navigateToSearchPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchNamaPelanggan(),
      ),
    );

    if (result != null) {
      setState(() {
        selectedCustomer = result;
      });
      await _fetchCustomerItems(result);
    }
  }

  Future<void> _fetchCustomerItems(String customerName) async {
    final customer = await _pelangganDao.getPelangganByName(customerName);

    if (customer != null) {
      final customerItems =
          await _pelangganDao.getBarangByPelangganId(customer.id);

      setState(() {
        selectedItems.clear();
        selectedPrices.clear();
        quantities.clear();
        priceControllers.clear();

        for (var item in customerItems) {
          selectedItems.add(item.namaBarang);
          selectedPrices.add(item.harga.toInt());
          quantities.add(1);
          priceControllers
              .add(TextEditingController(text: item.harga.toString()));
        }
      });
    }
  }

  Future<void> _navigateToSearchPageTambahBarang() async {
    final List<String> barangList = await database.getAllItemNames();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          barangList: barangList,
          selectedItems: selectedItems,
        ),
      ),
    );

    if (result != null) {
      final itemDetails = await database.getItemDetails(result);

      if (itemDetails != null) {
        setState(() {
          selectedItems.add(result);
          quantities.add(1);
          selectedPrices.add(itemDetails.harga_jual);
          priceControllers.add(
              TextEditingController(text: itemDetails.harga_jual.toString()));
        });
      }
    }
  }

  void _showEditPriceDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ubah Harga'),
          content: TextField(
            controller: priceControllers[index],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Harga Baru',
              prefixText: 'Rp. ',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedPrices[index] =
                      int.tryParse(priceControllers[index].text) ??
                          selectedPrices[index];
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  int getTotalPrice() {
    int total = 0;
    for (int i = 0; i < selectedPrices.length; i++) {
      total += selectedPrices[i] * quantities[i];
    }
    return total;
  }

  String formatItemName(String itemName) {
    if (itemName.length > 10) {
      return itemName.substring(0, 10) + '...';
    }
    return itemName;
  }

  String formatCurrency(int price) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Masukan Barang & Harga',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navbarProvider.navigateTo(0);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _navigateToSearchPage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Nama: ${selectedCustomer ?? '-'}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              for (int i = 0; i < selectedItems.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.box,
                                        size: 40,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              formatItemName(selectedItems[i]),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () =>
                                                  _showEditPriceDialog(i),
                                              child: Text(
                                                formatCurrency(
                                                    selectedPrices[i]),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => _decreaseQuantity(i),
                                    icon: Icon(Icons.remove),
                                    color: Colors.red,
                                    iconSize: 30,
                                  ),
                                  Container(
                                    width: 50,
                                    child: Text(
                                      quantities[i].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _increaseQuantity(i),
                                    icon: Icon(Icons.add),
                                    color: Colors.green,
                                    iconSize: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total: ${formatCurrency(selectedPrices[i] * quantities[i])}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedItems.removeAt(i);
                                      selectedPrices.removeAt(i);
                                      quantities.removeAt(i);
                                      priceControllers.removeAt(i);
                                    });
                                  },
                                  icon: Icon(Icons.delete,
                                      color: Colors.red, size: 18),
                                  padding: EdgeInsets.all(0),
                                  iconSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: GestureDetector(
                  onTap: _navigateToSearchPageTambahBarang,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 40,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Tambah Barang',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${formatCurrency(getTotalPrice())}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: _showPaymentDialog,
                child: const Text('Bayar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
