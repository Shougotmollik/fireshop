import 'package:fireshop/controller_binder.dart';
import 'package:fireshop/services/storage_service.dart';
import 'package:fireshop/views/auth/screens/login_screen.dart';
import 'package:fireshop/views/main_nav/main_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FireShop',
      initialBinding: ControllerBinder(),
      home: StorageService.userSession != null
          ? MainNavBarScreen()
          : LoginScreen(),
    );
  }
}
