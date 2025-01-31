// navbar_provider.dart
import 'package:aplikasi/database/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../input/input_barang.dart';
import '../input/input_pelanggan.dart';
import '../input/input_transaction.dart';
import '../loading.dart';
import '../screen/screen1.dart';
import '../screen/screen2.dart';
import '../screen/screen3.dart';
import '../screen/screen4.dart';

class NavbarProvider with ChangeNotifier {
  final AppDatabase database;
  NavbarProvider(this.database);

  static final List<NavbarItem> _items = [
    NavbarItem(
      label: 'Home',
      screen: Screen1(),
      icon: Icons.home,
      showInNavBar: true,
    ),
    NavbarItem(
      label: 'Daftar Barang',
      screen: Screen2(),
      icon: FontAwesomeIcons.box,
      showInNavBar: true,
    ),
    NavbarItem(
      label: 'Langganan/Sales',
      screen: Screen3(),
      icon: Icons.supervised_user_circle_outlined,
      showInNavBar: true,
    ),
    NavbarItem(
      label: 'Pembukuan',
      screen: Screen4(),
      icon: Icons.menu_book,
      showInNavBar: true,
    ),
    NavbarItem(
      screen: InputTransaction(),
      showInNavBar: false,
    ),
    NavbarItem(
      screen: NextScreen(),
      showInNavBar: false,
    ),
    NavbarItem(
      screen: InputPelanggan(),
      showInNavBar: false,
    ),
    NavbarItem(
      screen: Loading(),
      showInNavBar: false,
    ),
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => _items[_selectedIndex].screen;

  List<BottomNavigationBarItem> get navigationItems => _items
      .where((item) => item.showInNavBar)
      .map((item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          ))
      .toList();

  void navigateTo(int index) {
    if (index >= 0 && index < _items.length) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}

class NavbarItem {
  final String? label;
  final Widget screen;
  final IconData? icon;
  final bool showInNavBar;

  NavbarItem({
    this.label,
    required this.screen,
    this.icon,
    this.showInNavBar = false,
  });
}
