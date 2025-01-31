import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  static final List<TransactionTab> items = [
    TransactionTab(label: 'Home'),
    TransactionTab(label: 'Hutang'),
    TransactionTab(label: 'Lunas'),
  ];

  int _selectedIndex = 0;
  bool _shouldRefresh = false;

  int get selectedIndex => _selectedIndex;
  List<TransactionTab> get navItems => items;
  bool get shouldRefresh => _shouldRefresh;

  void navigateTo(int index) {
    if (index >= 0 && index < items.length && _selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void triggerRefresh() {
    _shouldRefresh = true;
    notifyListeners();
  }

  void resetRefresh() {
    _shouldRefresh = false;
  }
}

class TransactionTab {
  final String label;
  final Widget? screen;

  const TransactionTab({required this.label, this.screen});
}
