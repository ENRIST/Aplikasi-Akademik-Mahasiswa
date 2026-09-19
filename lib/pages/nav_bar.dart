import 'package:flutter/material.dart';

// PASTIKAN KEDUA IMPORT INI ADA DAN NAMANYA SESUAI DENGAN FILE KAMU, KALO MAU NAMBAH PAGES FILENYA TARO BAGIAN INI YA REK
import 'biodata_mahasiswa.dart';
import 'kalender_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const Center(child: Text('Halaman Pesan (Belum Ada)')),
    HomePage(),
    KalenderPage(),
    BiodataMahasiswaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFF2196F3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.email_outlined, index: 0),
            _buildNavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              index: 1,
            ),
            _buildNavItem(icon: Icons.calendar_month_outlined, index: 2),
            _buildNavItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    IconData? activeIcon,
    required int index,
  }) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: isActive
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                activeIcon ?? icon,
                color: const Color(0xFF2196F3),
                size: 22,
              ),
            )
          : Icon(icon, color: Colors.white, size: 24),
    );
  }
}
