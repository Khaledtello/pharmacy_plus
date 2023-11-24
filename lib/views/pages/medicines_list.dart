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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<MedicineController>(
        init: MedicineController(),
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
                    list: controller.categoriesList,
                    textFocusNode: controller.categoriesFocus,
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
                itemCount: controller.filteredMedicines.length,
                itemBuilder: (context, index) {
                  return MedicineItem(controller.filteredMedicines[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
