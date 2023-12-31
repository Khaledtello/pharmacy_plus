import 'package:get/get.dart';
import 'package:pharmacy/constants/pages.dart';
import 'package:pharmacy/models/user_model.dart';
import 'package:pharmacy/services/api_service.dart';
import 'package:pharmacy/services/storage_service.dart';

class AuthService extends GetxService {
  static const String _tokenKey = 'token';
  final StorageService _storage = Get.find();
  late UserModel user;
  bool _isAuth = false;

  static AuthService get to => Get.find();

  Future<void> checkLoginStatus() async {
    _isAuth = false;
    if (token != null) {
      try {
        Response response = await APIService.to.userInfo();
        if (response.status.isOk) {
          _isAuth = true;
          user = UserModel.fromJson(response.body);
        } else
          print(response.body);
      } catch (e) {
        print(e);
      }
    }
  }

  void login(String token) {
    _isAuth = true;
    _storage.write(_tokenKey, token);
  }

  void logout() {
    _isAuth = false;
    _storage.remove(_tokenKey);
    Get.offAllNamed(AppPages.login);
  }

  bool get isAuth => _isAuth;

  String? get token => _storage.read(_tokenKey);
}
