import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/models/medicine_model.dart';

class MedicineItem extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineItem(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
        subtitle: Text(
          medicine.category.toString(),
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
                    text2(medicine.category!),
                    text1('manufacturer'),
                    text2(medicine.manufacturer!),
                    text1('quantity'),
                    text2(medicine.quantity.toString()),
                    text1('expiry_date'),
                    text2(medicine.expiryDate.toString()),
                    text1('price'),
                    text2(medicine.price.toString()),
                  ],
                ),
              ),
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
