class ManufacturerModel {
  int? id;
  String? englishName;
  String? arabicName;

  ManufacturerModel({this.id, this.englishName, this.arabicName});

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      ManufacturerModel(
        id: json['id'],
        englishName: json['companyName'],
        arabicName: json['arabic'],
      );

  static List<ManufacturerModel> listFromJson(List json) =>
      List<ManufacturerModel>.from(
          json.map((manufacturer) => ManufacturerModel.fromJson(manufacturer)));
}
