import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/constants/pages.dart';
import 'package:pharmacy/services/api_service.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/services/storage_service.dart';
import 'package:pharmacy/services/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => StorageService().init());
  Get.put(AuthService());
  Get.put(LocalizationService());
  Get.put(APIService());
  await AuthService.to.checkLoginStatus();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService.to.local,
      fallbackLocale: LocalizationService.to.local,
      theme: ThemeData(
        fontFamily: 'Baloo',
        primaryColor: AppColors.blue,
      ),
      initialRoute: AppPages.init,
      getPages: AppPages.pages,
    );
  }
}
