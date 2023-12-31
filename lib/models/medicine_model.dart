import 'package:pharmacy/models/category_model.dart';
import 'package:pharmacy/models/manufacturer_model.dart';

class MedicineModel {
  int? id;
  String? scientificName;
  String? commercialName;
  CategoryModel? category;
  ManufacturerModel? manufacturer;
  int? quantity;
  DateTime? expiryDate;
  double? price;

  MedicineModel({
    this.id,
    this.scientificName,
    this.commercialName,
    this.category,
    this.manufacturer,
    this.quantity,
    this.expiryDate,
    this.price,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        id: json["id"],
        scientificName: json["scientificName"],
        commercialName: json["tradeName"],
        category: CategoryModel.fromJson(json["classification"]),
        manufacturer: ManufacturerModel.fromJson(json["companyName"]),
        quantity: json["availableQuantity"],
        expiryDate: json["expiryDate"] == null
            ? null
            : DateTime.parse(json["expiryDate"]),
        price: json["price"] == null ? null : double.parse(json["price"]),
      );

  static List<MedicineModel> listFromJson(List json) =>
      List<MedicineModel>.from(
          json.map((medicine) => MedicineModel.fromJson(medicine)));
}
