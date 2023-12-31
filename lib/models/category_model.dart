class CategoryModel {
  int? id;
  String? englishName;
  String? arabicName;

  CategoryModel({this.id, this.englishName, this.arabicName});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        englishName: json['name'],
        arabicName: json['arabic'],
      );

  static List<CategoryModel> listFromJson(List json) =>
      List<CategoryModel>.from(
          json.map((category) => CategoryModel.fromJson(category)));
}
