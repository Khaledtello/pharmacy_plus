import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/services/localization_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = Get.find();
    LocalizationService local = Get.find();

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            color: AppColors.blue,
            child: Text(
              'profile'.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            title: auth.user.name!,
            icon: Icons.person,
          ),
          DrawerListTile(
            title: auth.user.phoneNumber!,
            icon: Icons.phone,
          ),
          DrawerListTile(
            title: 'logout'.tr,
            icon: Icons.logout,
            onTap: () {
              auth.logout();
            },
          ),
          DrawerListTile(
            title: 'language'.tr,
            icon: Icons.language,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                'arabic'.tr,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Radio(
                value: 'ar',
                groupValue: Get.locale.toString(),
                onChanged: (value) => local.changeLocal('ar'),
                activeColor: AppColors.orange,
              ),
              const Spacer(),
              Text(
                'english'.tr,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Radio(
                value: 'en',
                groupValue: Get.locale.toString(),
                onChanged: (value) => local.changeLocal('en'),
                activeColor: AppColors.orange,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        color: AppColors.orange,
        size: 30,
      ),
    );
  }
}
