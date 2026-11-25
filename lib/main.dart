import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weeksebelas/app_binding.dart';
import 'package:weeksebelas/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Barang',
      initialBinding: Appbinding(),
      home: HomeScreen(),
    );
  }
}
