import 'package:get/get.dart';
import 'package:pharmacy/models/medicine_model.dart';
import 'package:pharmacy/services/api_service.dart';

class BasketController extends GetxController {
  List<({MedicineModel medicine, int quantity})> basket = [];
  final APIService _api = Get.find();

  void sendOrder() async {
    List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(
        basket.map((item) =>
            {'medicine_id': item.medicine.id, 'quantity': item.quantity}));

    try {
      Response response = await _api.sendOrder(items);
      if (response.status.isOk) {
        basket = [];
      } else
        print(response.body);
    } catch (e) {
      print('Error: $e');
    }

    update();
  }
}
