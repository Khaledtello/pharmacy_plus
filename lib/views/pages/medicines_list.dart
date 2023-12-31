import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/controllers/medicine_controller.dart';
import 'package:pharmacy/views/widgets/app_text_field.dart';
import 'package:pharmacy/views/widgets/drop_list_search.dart';
import 'package:pharmacy/views/widgets/medicine_item.dart';

class MedicinesList extends StatelessWidget {
  const MedicinesList({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<MedicineController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 18),
            AppTextField(
              hint: 'search_medicine'.tr,
              controller: controller.searchController,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: DropListSearch(
                    list: List<String>.from(
                      controller.categories.map(
                        (category) => Get.locale.toString() == 'ar'
                            ? category.arabicName
                            : category.englishName,
                      ),
                    ),
                    textFocusNode: focusNode,
                    textController: controller.categoriesController,
                    hint: 'choose_category'.tr,
                    readOnly: true,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'favorite'.tr,
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.orange,
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: controller.medicines.length,
                itemBuilder: (context, index) {
                  return MedicineItem(controller.medicines[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
