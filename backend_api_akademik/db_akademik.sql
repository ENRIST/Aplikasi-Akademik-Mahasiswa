-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Okt 2026 pada 11.41
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `kode_mk` varchar(20) DEFAULT NULL,
  `nama_mk` varchar(100) DEFAULT NULL,
  `dosen` varchar(100) DEFAULT NULL,
  `ruangan` varchar(50) DEFAULT NULL,
  `hari` varchar(15) DEFAULT NULL,
  `jam` varchar(30) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `mata_kuliah` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL,
  `nilai` varchar(5) NOT NULL,
  `bobot` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`id`, `nim`, `mata_kuliah`, `sks`, `nilai`, `bobot`) VALUES
(1, '24051214157', 'Pemrograman Aplikasi Bergerak', 3, 'A', '4.00'),
(2, '24051214157', 'Basis Data', 3, 'A-', '3.75'),
(3, '24051214157', 'Analisis dan Perancangan Sistem', 3, 'B+', '3.50'),
(4, '24051214157', 'Manajemen Proyek Sistem Informasi', 3, 'A', '4.00'),
(5, '24051214157', 'Data Analytics', 3, 'A-', '3.75'),
(6, '24051214157', 'Manajemen Layanan TI', 3, 'B+', '3.50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `mata_kuliah` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`id`, `nim`, `mata_kuliah`, `sks`) VALUES
(1, '24051214157', 'Pemrograman Aplikasi Bergerak', 3),
(2, '24051214157', 'Basis Data', 3),
(3, '24051214157', 'Analisis dan Perancangan Sistem', 3),
(4, '24051214157', 'Manajemen Proyek Sistem Informasi', 3),
(5, '24051214157', 'Data Analytics', 3),
(6, '24051214157', 'Manajemen Layanan TI', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `prodi` varchar(50) DEFAULT 'S1 Sistem Informasi',
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `email`, `password`, `prodi`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`) VALUES
('24051214157', 'FEBBY AULIA DIVA IRDANI', '24051214157@mhs.unesa.ac.id', '123456', 'S1 Sistem Informasi', 'Perempuan', 'Lumajang', '2006-02-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_mahasiswa`
--

CREATE TABLE `status_mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `ukt` varchar(30) NOT NULL,
  `pembayaran` varchar(20) NOT NULL DEFAULT 'Sudah Bayar',
  `status` varchar(20) NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `status_mahasiswa`
--

INSERT INTO `status_mahasiswa` (`id`, `nim`, `semester`, `ukt`, `pembayaran`, `status`) VALUES
(1, '24051214157', '2024/2025 Gasal', 'Rp 6.540.000', 'Sudah Bayar', 'Aktif'),
(2, '24051214157', '2024/2025 Genap', 'Rp 6.540.000', 'Sudah Bayar', 'Aktif'),
(3, '24051214157', '2025/2026 Gasal', 'Rp 6.540.000', 'Sudah Bayar', 'Aktif'),
(4, '24051214157', '2025/2026 Genap', 'Rp 6.540.000', 'Sudah Bayar', 'Aktif'),
(5, '24051214157', '2026/2027 Gasal', 'Rp 6.540.000', 'Sudah Bayar', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `khs`
--
ALTER TABLE `khs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  ADD CONSTRAINT `status_mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
