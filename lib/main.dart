import 'package:aplikasi/provider/navbar_provider.dart';
import 'package:aplikasi/provider/transaction_provider.dart';
import 'package:aplikasi/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = AppDatabase();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavbarProvider>(
          create: (_) => NavbarProvider(database),
        ),
        ChangeNotifierProvider<TransactionProvider>(
          create: (_) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AppDatabase database;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(
        database: AppDatabase(),
      ),
    );
  }
}
