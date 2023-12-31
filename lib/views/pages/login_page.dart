import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/constants/images.dart';
import 'package:pharmacy/constants/pages.dart';
import 'package:pharmacy/controllers/auth_controller.dart';
import 'package:pharmacy/views/widgets/app_button.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/views/widgets/app_text_field.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //controller.init();

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
              hint: 'enter_mobile'.tr,
              withLabel: true,
              controller: controller.phoneController,
            ),
            const Spacer(flex: 2),
            AppTextField(
              hint: 'enter_password'.tr,
              withLabel: true,
              controller: controller.passwordController,
            ),
            const Spacer(flex: 12),
            AppButton(
              onPressed: () async {
                await controller.login();
              },
              color: AppColors.blue,
              title: 'login'.tr,
            ),
            const Spacer(flex: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('new_user'.tr),
                TextButton(
                  onPressed: () => Get.toNamed(AppPages.register),
                  child: Text(
                    'create_account'.tr,
                    style: const TextStyle(color: AppColors.orange),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
