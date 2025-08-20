import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireshop/services/storage_service.dart';
import 'package:fireshop/utils/helper/ui_helper.dart';
import 'package:fireshop/views/main_nav/main_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var regiLoading = false.obs;
  var loginLoading = false.obs;

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();

  // Registration method
  Future<void> registration(String name, String email, String password) async {
    if (password.isNotEmpty && name.isNotEmpty && email.isNotEmpty) {
      try {
        regiLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Save user session locally
        StorageService.saveSession({
          'uid': userCredential.user?.uid,
          'email': userCredential.user?.email,
        });

        regiLoading.value = false;
        showSnackBar('Success', 'Registered successfully');
        Get.offAll(MainNavBarScreen());
      } on FirebaseAuthException catch (e) {
        regiLoading.value = false;
        if (e.code == 'weak-password') {
          showSnackBar(
            'Failed!',
            'Provided password is too weak',
            isError: true,
          );
        } else if (e.code == 'email-already-in-use') {
          showSnackBar('Failed!', 'Email already exists', isError: true);
        }
      }
    }
  }

  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        loginLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // Save user session locally
        StorageService.saveSession({
          'uid': userCredential.user?.uid,
          'email': userCredential.user?.email,
        });
        loginLoading.value = false;
        showSnackBar('Success', 'Login Successfully');
        Get.offAll(MainNavBarScreen());
      } on FirebaseAuthException catch (e) {
        loginLoading.value = false;
        if (e.code == 'user-not-found') {
          showSnackBar('Failed!', 'User not exists', isError: true);
        } else if (e.code == 'wrong-password') {
          showSnackBar('Failed!', 'Wrong password', isError: true);
        }
      }
    }
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    nameTEController.dispose();
    super.dispose();
  }
}
