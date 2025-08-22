import 'package:fireshop/admin/views/home/add_product_screen.dart';
import 'package:fireshop/controller_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FireShop',
      initialBinding: ControllerBinder(),
      home: AddProductScreen(),
    );
  }
}
