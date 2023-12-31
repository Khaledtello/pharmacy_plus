import 'package:get/get.dart';
import 'package:pharmacy/controllers/auth_controller.dart';
import 'package:pharmacy/controllers/basket_controller.dart';
import 'package:pharmacy/controllers/medicine_controller.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/views/pages/home_page.dart';
import 'package:pharmacy/views/pages/login_page.dart';
import 'package:pharmacy/views/pages/register_page.dart';

abstract class AppPages {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static final String init = AuthService.to.isAuth ? home : login;

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.put(MedicineController());
        Get.put(BasketController());
      }),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: BindingsBuilder.put(() => AuthController()),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
      binding: BindingsBuilder.put(() => AuthController()),
    ),
  ];
}
