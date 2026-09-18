import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/kalender_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/status_mahasiswa.dart';
import 'pages/biodata_mahasiswa.dart';
import 'pages/nav_bar.dart';

class AppRoutes {
  static const String login = 'pages/login_page.dart';
  static const String forgotPassword = 'pages/forgot_password_page.dart';
  static const String home = 'pages/home_page.dart';
  static const String kalender = 'pages/kalender_page.dart';
  static const String statusMahasiswa = 'pages/status_mahasiswa.dart';
  static const String biodataMahasiswa = 'pages/biodata_mahasiswa.dart';
  static const String mainPage = 'pages/nav_bar.dart';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    home: (context) => const HomePage(),
    kalender: (context) => const KalenderPage(),
    statusMahasiswa: (context) => const StatusMahasiswaPage(),
    biodataMahasiswa: (context) => const BiodataMahasiswaPage(),
    mainPage: (context) => const MainPage(),
  };
}
