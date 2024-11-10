import 'package:apps_kulineran/views/features/favorite.dart';
import 'package:apps_kulineran/views/features/home.dart';
import 'package:apps_kulineran/views/features/keranjang.dart';
import 'package:apps_kulineran/views/features/profile.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  // Daftar page tab bottom bar
  final List<Widget> _pages = const [
    HomePage(),
    KeranjangPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  // Fungsi untuk mengatur perubahan tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[_selectedIndex], // Menampilkan halaman tab yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: gray,
        onTap: _onItemTapped,
      ),
    );
  }
}
