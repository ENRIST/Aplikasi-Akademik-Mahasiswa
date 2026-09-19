import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/kalender_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/status_mahasiswa.dart';
import 'pages/biodata_mahasiswa.dart';
import 'pages/nav_bar.dart';
import 'pages/krs_page.dart';
import 'pages/jadwal_page.dart';
import 'pages/khs_page.dart';

class AppRoutes {
  static const String login = 'pages/login_page.dart';
  static const String forgotPassword = 'pages/forgot_password_page.dart';
  static const String home = 'pages/home_page.dart';
  static const String kalender = 'pages/kalender_page.dart';
  static const String statusMahasiswa = 'pages/status_mahasiswa.dart';
  static const String biodataMahasiswa = 'pages/biodata_mahasiswa.dart';
  static const String mainPage = 'pages/nav_bar.dart';
  static const String krs = 'pages/krs_page.dart';
  static const String jadwal = 'pages/jadwal_page.dart';
  static const String khs = 'pages/khs_page.dart';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    home: (context) => const MainPage(),
    kalender: (context) => const KalenderPage(),
    statusMahasiswa: (context) => const StatusMahasiswaPage(),
    biodataMahasiswa: (context) => const BiodataMahasiswaPage(),
    mainPage: (context) => const MainPage(),
    krs: (context) => const KrsPage(),
    jadwal: (context) => const JadwalPage(),
    khs: (context) => const KhsPage(),
  };
}
