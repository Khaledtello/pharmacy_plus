import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/models/category_model.dart';
import 'package:pharmacy/models/medicine_model.dart';
import 'package:pharmacy/services/api_service.dart';

class MedicineController extends GetxController {
  final APIService _api = Get.find();
  List<MedicineModel> medicines = [];
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> categories = [];
  TextEditingController categoriesController = TextEditingController();

  @override
  void onReady() async {
    super.onReady();

    await fetchMedicines();
    await fetchCategories();
    searchController.addListener(() => fetchMedicines());
    categoriesController.addListener(() => fetchMedicines());
  }

  Future<void> fetchMedicines() async {
    try {
      Response response = await _api.search(
        tradeName: searchController.text,
        category: categoriesController.text,
      );
      if (response.status.isOk)
        medicines = MedicineModel.listFromJson(response.body['data'][0]);
      else
        print(response.body);
    } catch (e) {
      print(e);
    }

    update();
  }

  Future<void> fetchCategories() async {
    categories = [CategoryModel(englishName: '', arabicName: '')];
    try {
      Response response = await _api.getAllCategories();
      if (response.status.isOk)
        categories.addAll(CategoryModel.listFromJson(response.body['data']));
      else
        print(response.body);
    } catch (e) {
      print(e);
    }

    update();
  }

  // void filterMedicines() {
  //   filteredMedicines = medicines
  //       .where((medicine) =>
  //           (categoriesController.text.isEmpty ||
  //               medicine.category == categoriesController.text) &&
  //           (medicine.scientificName!.contains(searchController.text) ||
  //               medicine.commercialName!.contains(searchController.text) ||
  //               medicine.category!.contains(searchController.text)))
  //       .toList();

  //   update();
  // }

  // void filterCategories() {
  //   categoriesList = medicines
  //       .where((medicine) =>
  //           medicine.category!.contains(categoriesController.text))
  //       .map((medicine) => medicine.category!)
  //       .toList();

  //   update();
  // }

  // void setCategoriesFocusListener() {
  //   categoriesFocus.addListener(() {
  //     if (!categoriesFocus.hasFocus) {
  //       if (categoriesList.isEmpty ||
  //           categoriesController.text != categoriesList[0])
  //         categoriesController.text = '';
  //       filterMedicines();
  //     }
  //   });
  // }
}
