import 'package:flutter/material.dart';
import '../routes.dart';

class BiodataMahasiswaPage extends StatefulWidget {
  const BiodataMahasiswaPage({super.key});

  @override
  State<BiodataMahasiswaPage> createState() => _BiodataMahasiswaPageState();
}

class _BiodataMahasiswaPageState extends State<BiodataMahasiswaPage> {
  final int _currentNavIndex = 3; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 55, bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.person, size: 55, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'FEBBY AULIA DIVA IRDANI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'S1 Sistem Informasi',
                    style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0.5,
                color: const Color(0xFFFAFAFA),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: [
                      _buildProfileRow('NIPD', '24051214157'),
                      _buildProfileRow('Jenis Kelamin', 'Perempuan'),
                      _buildProfileRow('Tempat', 'Lumajang'),
                      _buildProfileRow('Tanggal Lahir', '2006-02-14'),
                      _buildProfileRow('Email', '24051214157@mhs.unesa.ac.id', isLast: true),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5252),
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(String label, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            // Typo CrossAlignment diperbaiki jadi CrossAxisAlignment
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$label: ',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
              ),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, thickness: 0.7),
      ],
    );
  }
}
