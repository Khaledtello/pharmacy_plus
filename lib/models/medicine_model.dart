class MedicineModel {
  final int? id;
  final String? scientificName;
  final String? commercialName;
  final String? category;
  final String? manufacturer;
  final int? quantity;
  final DateTime? expiryDate;
  final double? price;

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
}
