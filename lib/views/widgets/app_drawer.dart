import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          const DrawerListTile(
            title: 'Khaled Tello',
            icon: Icons.person,
          ),
          const DrawerListTile(
            title: '0958743026',
            icon: Icons.phone,
          ),
          DrawerListTile(
            title: 'logout'.tr,
            icon: Icons.logout,
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
                onChanged: (value) {
                  Get.updateLocale(const Locale('ar'));
                },
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
                onChanged: (value) {
                  Get.updateLocale(const Locale('en'));
                },
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

  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
