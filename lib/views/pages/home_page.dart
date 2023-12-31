import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/views/pages/basket_page.dart';
import 'package:pharmacy/views/pages/medicines_list.dart';
import 'package:pharmacy/views/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final List<Map<String, dynamic>> pages = [
    {
      'page': const MedicinesList(),
      'title': 'medicines_list',
    },
    {
      'page': const BasketPage(),
      'title': 'basket',
    },
    {
      'page': const SizedBox(),
      'title': 'orders_list',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectedPage]['title'].toString().tr,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            icon: const Icon(Icons.shopping_cart_outlined),
            label: 'basket'.tr,
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
