import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/pages.dart';
import 'package:pharmacy/models/user_model.dart';
import 'package:pharmacy/services/api_service.dart';
import 'package:pharmacy/services/auth_service.dart';

class AuthController extends GetxController {
  final APIService _api = Get.find();
  final AuthService _auth = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void init() {
  //   nameController = TextEditingController();
  //   phoneController = TextEditingController();
  //   passwordController = TextEditingController();
  // }

  Future register() async {
    _auth.user = UserModel(
      name: nameController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
      role: 'pharmacy',
    );

    try {
      Response response = await _api.register(_auth.user);
      if (response.status.isOk) {
        _auth.user = UserModel.fromJson(response.body['user']);
        _auth.login(response.body['token']);
        print(_auth.token);
        Get.offAllNamed(AppPages.home);
      } else
        print(response.body);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future login() async {
    _auth.user = UserModel(
      phoneNumber: phoneController.text,
      password: passwordController.text,
      role: 'pharmacy',
    );

    try {
      Response response = await _api.login(_auth.user);
      if (response.status.isOk) {
        _auth.user = UserModel.fromJson(response.body['user']);
        _auth.login(response.body['token']);
        Get.offAllNamed(AppPages.home);
      } else
        print(response.body);
    } catch (e) {
      print('Error: $e');
    }
  }
}
