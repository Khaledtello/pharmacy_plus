import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/constants/images.dart';
import 'package:pharmacy/views/pages/home_page.dart';
import 'package:pharmacy/views/widgets/app_button.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/views/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 10),
            Lottie.asset(
              Assets.imagesMedicine,
              height: 200,
              width: 300,
              repeat: false,
            ),
            const Spacer(flex: 2),
            const Center(
              child: Text(
                'Pharmacy Plus',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: AppColors.blue,
                ),
              ),
            ),
            const Spacer(flex: 2),
            AppTextField(
              hint: 'enter_name'.tr,
              withLabel: true,
            ),
            const Spacer(flex: 2),
            AppTextField(
              hint: 'enter_mobile'.tr,
              withLabel: true,
            ),
            const Spacer(flex: 10),
            AppButton(
              onPressed: () => Get.to(() => const HomePage()),
              color: AppColors.blue,
              title: 'login'.tr,
            ),
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
