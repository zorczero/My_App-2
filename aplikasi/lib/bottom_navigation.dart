import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.box),
          label: 'Daftar Barang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Langganan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Pembukuan',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
