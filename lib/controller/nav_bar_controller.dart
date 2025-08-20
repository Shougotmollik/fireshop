import 'package:fireshop/views/main_nav/home/screens/home_screen.dart';
import 'package:fireshop/views/main_nav/order/screens/order_screen.dart';
import 'package:fireshop/views/main_nav/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = const [
    HomeScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
