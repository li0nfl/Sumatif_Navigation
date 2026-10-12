import 'package:flutter/material.dart';
import 'package:ujian_navigator/catalog_page.dart';
import 'package:ujian_navigator/detail_page.dart';
import 'package:ujian_navigator/login_page.dart';
import 'package:ujian_navigator/profile_page.dart';
import 'package:ujian_navigator/voucher_page.dart';

void main() {
  runApp(const TechExpressApp());
}

class TechExpressApp extends StatelessWidget {
  const TechExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechExpress',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/catalog': (context) => const CatalogPage(),
        '/profile': (context) => const ProfilePage(),
        '/voucher': (context) => const VoucherPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
