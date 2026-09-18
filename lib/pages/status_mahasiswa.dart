import 'package:flutter/material.dart';
import '../routes.dart';

class StatusMahasiswaPage extends StatefulWidget {
  const StatusMahasiswaPage({super.key});

  @override
  State<StatusMahasiswaPage> createState() => _StatusMahasiswaPageState();
}

class _StatusMahasiswaPageState extends State<StatusMahasiswaPage> {
  final List<Map<String, String>> riwayatList = [
    {'semester': '2024/2025 Gasal', 'ukt': 'Rp 6.540.000', 'pembayaran': 'Sudah Bayar', 'status': 'Aktif'},
    {'semester': '2024/2025 Genap', 'ukt': 'Rp 6.540.000', 'pembayaran': 'Sudah Bayar', 'status': 'Aktif'},
    {'semester': '2025/2026 Gasal', 'ukt': 'Rp 6.540.000', 'pembayaran': 'Sudah Bayar', 'status': 'Aktif'},
    {'semester': '2025/2026 Genap', 'ukt': 'Rp 6.540.000', 'pembayaran': 'Sudah Bayar', 'status': 'Aktif'},
    {'semester': '2026/2027 Gasal', 'ukt': 'Rp 6.540.000', 'pembayaran': 'Sudah Bayar', 'status': 'Aktif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // const-nya dihapus di sini
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.biodataMahasiswa,
            );
          },
        ),
        title: const Text(
          'Riwayat Status Mahasiswa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF2196F3),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 65,
                        height: 75,
                        color: Colors.red,
                        child: const Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FEBBY AULIA DIVA IRDANI',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                          ),
                          SizedBox(height: 4),
                          Text('24051214157', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          SizedBox(height: 2),
                          Text('S1 Sistem Informasi', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: riwayatList.length,
              itemBuilder: (context, index) {
                final item = riwayatList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                  color: const Color(0xFFF9FAFC),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['semester']!,
                          style: const TextStyle(
                            color: Color(0xFF2196F3),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const Divider(height: 16, thickness: 0.8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Nominal UKT ${item['ukt']}', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color(0xFFA5D6A7)),
                              ),
                              child: Text(
                                item['pembayaran']!,
                                style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Status Semester', style: TextStyle(fontSize: 12, color: Colors.black87)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color(0xFFA5D6A7)),
                              ),
                              child: Text(
                                item['status']!,
                                style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}