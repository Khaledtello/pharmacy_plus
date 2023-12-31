import 'package:get/get.dart';
import 'package:pharmacy/models/user_model.dart';
import 'package:pharmacy/services/auth_service.dart';

class APIService extends GetConnect implements GetxService {
  final AuthService _auth = Get.find();

  static APIService get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = 'http://10.0.2.2:8000/api/';
    httpClient.defaultContentType = "application/json";

    httpClient.addResponseModifier((request, response) {
      // print('Response Body: ${response.body}');
      if (response.status.isUnauthorized) _auth.logout();
      return response;
    });

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll({'Accept': 'application/json'});
      if (_auth.token != null)
        request.headers.addAll({'Authorization': "Bearer ${_auth.token}"});

      print('Request URL: ${request.url}');
      // print('Request Headers: ${request.headers}');
      return request;
    });
  }

  Future<Response> userInfo() => get('user');

  Future<Response> register(UserModel user) => post(
        'auth/register',
        user.toJson(),
      );

  Future<Response> login(UserModel user) => post(
        'auth/login',
        user.toJson(),
      );

  Future<Response> logout() => post('auth/logout', '');

  Future<Response> getAllMedicines() => get('pharmacy/medicines');

  Future<Response> search({String tradeName = '', String category = ''}) => get(
        'pharmacy/search',
        query: {
          if (tradeName.isNotEmpty) 'tradeName': tradeName,
          if (category.isNotEmpty) 'classification': category,
        },
      );

  Future<Response> getAllCategories() => get('pharmacy/classifications');

  Future<Response> sendOrder(List<Map<String, dynamic>> items) => post(
        'pharmacy/addorder',
        {'items': items},
      );

  Future<Response> getAllOrders() => get('pharmacy/order');

  Future<Response> getOrderDetails(int id) => get(
        'pharmacy/order',
        query: {'IncludeOrder_details': id},
      );
}
