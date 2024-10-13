import 'package:flutter/material.dart';
import 'package:aplikasi/screen/screen1.dart';
import 'package:aplikasi/screen/screen2.dart';
import 'package:aplikasi/screen/screen3.dart';
import 'package:aplikasi/screen/screen4.dart';
import 'package:aplikasi/input/input_barang.dart';
import 'package:aplikasi/input/input_pelanggan.dart';
import 'package:aplikasi/input/input_transaction.dart';
import 'bottom_navigation.dart';
import 'component/SearchDelegateScreen1.dart';
import 'component/SearchDelegateScreen2.dart';
import 'component/SearchDelegateScreen3.dart';
import 'database/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kepuh Listrik',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        hintColor: Colors.tealAccent,
        scaffoldBackgroundColor: const Color(0xFF2C2C2C),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1F1F1F),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1F1F1F),
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSearchForCurrentScreen() {
    if (_selectedIndex == 0) {
      final database = AppDatabase();
      showSearch(context: context, delegate: SearchDelegateScreen1(database));
    } else if (_selectedIndex == 1) {
      final database = AppDatabase();
      showSearch(context: context, delegate: SearchDelegateScreen2(database));
    } else if (_selectedIndex == 2) {
      final database = AppDatabase();
      showSearch(context: context, delegate: SearchDelegateScreen3(database));
    }
  }

  void _navigateToNextScreen() {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InputTransaction()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InputPelanggan()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kepuh Listrik',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchForCurrentScreen,
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNextScreen,
        tooltip: 'Next',
        child: const Icon(Icons.add),
      ),
    );
  }
}
