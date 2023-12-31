import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/controllers/basket_controller.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<BasketController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.basket.length,
                itemBuilder: (context, index) => Card(
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
                          text2(controller
                              .basket[index].medicine.scientificName!),
                          text1('commercial_name'),
                          text2(controller
                              .basket[index].medicine.commercialName!),
                          text1('required_quantity'),
                          text2(controller.basket[index].quantity.toString()),
                          text1('price'),
                          text2((controller.basket[index].quantity *
                                  controller.basket[index].medicine.price!)
                              .toString()),
                        ],
                      ),
                    ),
                    minVerticalPadding: 10,
                    trailing: IconButton(
                      onPressed: () =>
                          setState(() => controller.basket.removeAt(index)),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: MaterialButton(
                onPressed: () {
                  controller.sendOrder();
                },
                height: 50,
                color: AppColors.orange,
                elevation: 8,
                child: Text(
                  'send_order'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
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
