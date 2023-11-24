import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/views/pages/medicines_list.dart';
import 'package:pharmacy/views/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final List<Map<String, Widget>> pages = [
    {
      'page': const MedicinesList(),
      'title': Text(
        'medicines_list'.tr,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    },
    {
      'page': const MedicinesList(),
      'title': Text(
        'orders_list'.tr,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pages[selectedPage]['title'],
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: AppColors.blue,
      ),
      drawer: const AppDrawer(),
      body: pages[selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: Colors.white,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        currentIndex: selectedPage,
        onTap: (value) => setState(() => selectedPage = value),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.medication_liquid),
            label: 'medicines'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.delivery_dining),
            label: 'my_orders'.tr,
          ),
        ],
      ),
    );
  }
}
