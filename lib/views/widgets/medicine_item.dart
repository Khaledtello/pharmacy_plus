import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/controllers/basket_controller.dart';
import 'package:pharmacy/models/medicine_model.dart';
import 'package:pharmacy/views/widgets/app_text_field.dart';

class MedicineItem extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineItem(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
    BasketController basket = Get.find();
    TextEditingController textController = TextEditingController();
    bool isZero = true;

    return Card(
      elevation: 6,
      child: ListTile(
        title: RichText(
          text: TextSpan(
            style: const TextStyle(
              color: AppColors.blue,
              fontFamily: 'Baloo',
              fontSize: 18,
            ),
            children: [
              text1('scientific_name'),
              text2(medicine.scientificName!),
              text1('commercial_name'),
              text2(medicine.commercialName!),
              text1('category'),
              text2(Get.locale.toString() == 'ar'
                  ? medicine.category!.arabicName!
                  : medicine.category!.englishName!),
            ],
          ),
        ),
        minVerticalPadding: 10,
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontFamily: 'Baloo',
                    fontSize: 18,
                  ),
                  children: [
                    text1('scientific_name'),
                    text2(medicine.scientificName!),
                    text1('commercial_name'),
                    text2(medicine.commercialName!),
                    text1('category'),
                    text2(
                      Get.locale.toString() == 'ar'
                          ? medicine.category!.arabicName!
                          : medicine.category!.englishName!,
                    ),
                    text1('manufacturer'),
                    text2(
                      Get.locale.toString() == 'ar'
                          ? medicine.manufacturer!.arabicName!
                          : medicine.manufacturer!.englishName!,
                    ),
                    text1('available_quantity'),
                    text2(medicine.quantity.toString()),
                    text1('expiry_date'),
                    text2(medicine.expiryDate.toString()),
                    text1('price'),
                    text2(medicine.price.toString()),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                AppTextField(
                    width: 80,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    hint: '0',
                    controller: textController,
                    onChanged: (text) => isZero = text.numericOnly().isNum &&
                            textController.text == '0' ||
                        !text.numericOnly().isNum),
                TextButton(
                  onPressed: () {
                    if (!isZero)
                      basket.basket.add(
                        (
                          medicine: medicine,
                          quantity:
                              int.parse(textController.text.numericOnly()),
                        ),
                      );
                    Get.back();
                    textController.text = '';
                  },
                  child: Text(
                    'add_to_basket'.tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  TextSpan text1(String text) => TextSpan(text: '${text.tr} :   ');

  TextSpan text2(String text) => TextSpan(
        text: '$text\n',
        style: const TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
        ),
      );
}
