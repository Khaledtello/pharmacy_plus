import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/translations.dart';
import 'package:pharmacy/views/pages/login_page.dart';
import 'package:pharmacy/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      theme: ThemeData(
        fontFamily: 'Baloo',
        primaryColor: AppColors.blue,
      ),
    );
  }
}
