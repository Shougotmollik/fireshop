import 'package:fireshop/controller/nav_bar_controller.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavBarScreen extends StatelessWidget {
  const MainNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.find<NavBarController>();
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.scaffoldColor,
          elevation: 4,
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.currentIndex.value = index,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Order',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
