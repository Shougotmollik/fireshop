import 'package:fireshop/controller/auth_controller.dart';
import 'package:fireshop/controller/home_controller.dart';
import 'package:fireshop/controller/nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
