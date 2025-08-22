import 'package:fireshop/admin/controller/admin_add_product_controller.dart';
import 'package:fireshop/admin/controller/admin_auth_controller.dart';
import 'package:fireshop/controller/auth_controller.dart';
import 'package:fireshop/controller/home_controller.dart';
import 'package:fireshop/controller/nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // User end controllers
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());

    //   admin end Controllers
    Get.lazyPut<AdminAuthController>(() => AdminAuthController());
    Get.lazyPut<AdminAddProductController>(() => AdminAddProductController());
  }
}
