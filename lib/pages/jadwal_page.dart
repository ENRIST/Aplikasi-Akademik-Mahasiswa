import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),

      appBar: AppBar(
        title: const Text('Jadwal Kuliah'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Identitas mahasiswa
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF2196F3),
                      size: 30,
                    ),
                  ),

                  SizedBox(width: 14),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yusuf Aura',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'NIM: 12345',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Sistem Informasi • Semester 5',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // SENIN
            const Text(
              'Senin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),

            const SizedBox(height: 12),

            _buildJadwalCard(
              '08:00 - 09:40',
              'Pemrograman Aplikasi Bergerak',
              'Dosen Pengampu',
              'Ruang 01',
              '3 SKS',
            ),

            _buildJadwalCard(
              '10:00 - 11:40',
              'Basis Data',
              'Dosen Pengampu',
              'Ruang 02',
              '3 SKS',
            ),

            const SizedBox(height: 10),

            // SELASA
            const Text(
              'Selasa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),

            const SizedBox(height: 12),

            _buildJadwalCard(
              '08:00 - 09:40',
              'Analisis dan Perancangan Sistem',
              'Dosen Pengampu',
              'Ruang 03',
              '3 SKS',
            ),

            _buildJadwalCard(
              '13:00 - 14:40',
              'Manajemen Proyek Sistem Informasi',
              'Dosen Pengampu',
              'Ruang 04',
              '3 SKS',
            ),

            const SizedBox(height: 10),

            // RABU
            const Text(
              'Rabu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),

            const SizedBox(height: 12),

            _buildJadwalCard(
              '09:00 - 10:40',
              'Data Analytics',
              'Dosen Pengampu',
              'Laboratorium Komputer',
              '3 SKS',
            ),

            const SizedBox(height: 10),

            // KAMIS
            const Text(
              'Kamis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),

            const SizedBox(height: 12),

            _buildJadwalCard(
              '08:00 - 09:40',
              'Keamanan Sistem Informasi',
              'Dosen Pengampu',
              'Ruang 05',
              '3 SKS',
            ),

            _buildJadwalCard(
              '10:00 - 11:40',
              'Pemrograman Web',
              'Dosen Pengampu',
              'Laboratorium Komputer',
              '3 SKS',
            ),

            const SizedBox(height: 10),

            // JUMAT
            const Text(
              'Jumat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),

            const SizedBox(height: 12),

            _buildJadwalCard(
              '08:00 - 09:40',
              'Manajemen Layanan TI',
              'Dosen Pengampu',
              'Ruang 06',
              '3 SKS',
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildJadwalCard(
    String jam,
    String mataKuliah,
    String dosen,
    String ruangan,
    String sks,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0ECF7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time, color: Color(0xFF2196F3), size: 18),
              const SizedBox(width: 7),
              Text(
                jam,
                style: const TextStyle(
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            mataKuliah,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263238),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.person_outline, size: 17, color: Colors.grey),
              const SizedBox(width: 7),
              Text(dosen),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 17,
                color: Colors.grey,
              ),
              const SizedBox(width: 7),
              Text(ruangan),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(
                Icons.menu_book_outlined,
                size: 17,
                color: Colors.grey,
              ),
              const SizedBox(width: 7),
              Text(sks),
            ],
          ),
        ],
      ),
    );
  }
}
