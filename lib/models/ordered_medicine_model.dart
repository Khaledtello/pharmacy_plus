import 'package:pharmacy/models/medicine_model.dart';

class OrderedMedicineModel {
  int? id;
  MedicineModel? medicine;
  String? quantity;
  int? price;

  OrderedMedicineModel({this.id, this.medicine, this.quantity, this.price});

  factory OrderedMedicineModel.fromJson(Map<String, dynamic> json) =>
      OrderedMedicineModel(
        id: json['id'],
        medicine: MedicineModel.fromJson(json['medicine']),
        quantity: json['quantity'],
        price: json['price'],
      );

  static List<OrderedMedicineModel> listFromJson(List json) =>
      List<OrderedMedicineModel>.from(
          json.map((order) => OrderedMedicineModel.fromJson(order)));
}
