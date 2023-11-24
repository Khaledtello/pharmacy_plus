import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/models/medicine_model.dart';

class MedicineController extends GetxController {
  List<MedicineModel> medicines = [];
  List<MedicineModel> filteredMedicines = [];
  TextEditingController searchController = TextEditingController();
  List<String> categoriesList = [];
  TextEditingController categoriesController = TextEditingController();
  FocusNode categoriesFocus = FocusNode();

  @override
  void onReady() {
    super.onReady();

    fetchMedicines();
    filterMedicines();
    filterCategories();
    setCategoriesFocusListener();
    searchController.addListener(() => filterMedicines());
    categoriesController.addListener(() => filterCategories());
  }

  void fetchMedicines() {
    medicines = [
      MedicineModel(
        id: 1,
        scientificName: 'fjelks',
        commercialName: 'jelce',
        category: 'sefce',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'jfls',
        commercialName: 'ivjel',
        category: 'veilj',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'ivels',
        commercialName: 'jvle',
        category: 'jlef',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'jvile',
        commercialName: 'lmvi',
        category: 'fviel',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'همرث',
        commercialName: 'تمهرث',
        category: 'تنمتبثه',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
    ];
  }

  void filterMedicines() {
    filteredMedicines = medicines
        .where((medicine) =>
            (categoriesController.text.isEmpty ||
                medicine.category == categoriesController.text) &&
            (medicine.scientificName!.contains(searchController.text) ||
                medicine.commercialName!.contains(searchController.text) ||
                medicine.category!.contains(searchController.text)))
        .toList();

    update();
  }

  void filterCategories() {
    categoriesList = medicines
        .where((medicine) =>
            medicine.category!.contains(categoriesController.text))
        .map((medicine) => medicine.category!)
        .toList();

    update();
  }

  void setCategoriesFocusListener() {
    categoriesFocus.addListener(() {
      if (!categoriesFocus.hasFocus) {
        if (categoriesList.isEmpty ||
            categoriesController.text != categoriesList[0])
          categoriesController.text = '';
        filterMedicines();
      }
    });
  }
}
