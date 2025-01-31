import 'package:aplikasi/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/SearchDelegateScreen1.dart';
import '../component/SearchDelegateScreen2.dart';
import '../component/SearchDelegateScreen3.dart';
import '../provider/navbar_provider.dart';

class MainScreen extends StatelessWidget {
  final AppDatabase database;

  const MainScreen({Key? key, required this.database}) : super(key: key);

  void _showSearchForCurrentScreen(BuildContext context, int currentIndex) {
    final searchDelegates = {
      0: () => SearchDelegateScreen1(database),
      1: () => SearchDelegateScreen2(database),
      2: () => SearchDelegateScreen3(database),
    };

    if (searchDelegates.containsKey(currentIndex)) {
      showSearch(
        context: context,
        delegate: searchDelegates[currentIndex]!(),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pencarian tidak tersedia untuk halaman ini'),
        ),
      );
    }
  }

  void _onFabPressed(BuildContext context, int currentIndex) {
    final navbarProvider = Provider.of<NavbarProvider>(context, listen: false);
    final fabActions = {
      0: () => navbarProvider.navigateTo(4),
      1: () => navbarProvider.navigateTo(5),
      2: () => navbarProvider.navigateTo(6),
    };

    if (fabActions.containsKey(currentIndex)) {
      fabActions[currentIndex]!();
    }
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context, int currentIndex) {
    if (currentIndex >= 4) {
      return null;
    }

    final isSearchEnabled = currentIndex != 3;
    return AppBar(
      title: const Text("Kepuh Listrik"),
      actions: isSearchEnabled
          ? [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () =>
                    _showSearchForCurrentScreen(context, currentIndex),
              ),
            ]
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(
      builder: (context, navbarProvider, child) {
        final currentIndex = navbarProvider.selectedIndex;
        final showFab = currentIndex < 3;
        final showNavBar = currentIndex < 4;

        return Scaffold(
          appBar: _buildAppBar(context, currentIndex),
          body: navbarProvider.currentScreen,
          bottomNavigationBar: showNavBar
              ? BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index) => navbarProvider.navigateTo(index),
                  items: navbarProvider.navigationItems,
                )
              : null,
          floatingActionButton: showFab
              ? FloatingActionButton(
                  onPressed: () => _onFabPressed(context, currentIndex),
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
