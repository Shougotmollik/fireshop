import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireshop/admin/views/home/admin_home_screen.dart';
import 'package:fireshop/utils/helper/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminAuthController extends GetxController {
  var loginLoading = false.obs;

  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  // login method for admin
  Future<void> adminLogin({
    required String userName,
    required String password,
  }) async {
    final query = await FirebaseFirestore.instance
        .collection('admin')
        .where('username', isEqualTo: userName.trim())
        .where('password', isEqualTo: password.trim())
        .get();

    if (query.docs.isNotEmpty) {
      Get.offAll(AdminHomeScreen());
    } else {
      showSnackBar('Failed!', 'Invalid username or password', isError: true);
    }
  }

  @override
  void dispose() {
    nameTEController.dispose();
    passwordTEController.dispose();
    super.dispose();
  }
}
