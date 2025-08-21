import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireshop/services/database.dart';
import 'package:fireshop/services/shared_pref.dart';
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

  // Firebase Registration method with email and password
  Future<void> registration(String name, String email, String password) async {
    if (password.isNotEmpty && name.isNotEmpty && email.isNotEmpty) {
      try {
        regiLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // use Firebase UID
        String id = userCredential.user!.uid;

        // Save user session locally
        await SharedPreferenceHelper().saveUserId(id);
        await SharedPreferenceHelper().saveUserName(name);
        await SharedPreferenceHelper().saveUserEmail(email);
        await SharedPreferenceHelper().saveUserImage(
          'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        );

        // Store in Firestore DB
        Map<String, dynamic> userInfoMap = {
          'Name': name,
          "Email": email,
          "Id": id,
          "image": 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);

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

  // Firebase login method with email and password
  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        loginLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        String uid = userCredential.user!.uid;

        // Fetch user data from Firestore
        var userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          var userData = userDoc.data()!;

          // Save user session locally
          await SharedPreferenceHelper().saveUserId(uid);
          await SharedPreferenceHelper().saveUserEmail(email);
          await SharedPreferenceHelper().saveUserPassword(password);
          await SharedPreferenceHelper().saveUserName(userData['Name']);
          await SharedPreferenceHelper().saveUserImage(userData['image']);
        }

        loginLoading.value = false;
        showSnackBar('Success', 'Login Successfully');
        Get.offAll(MainNavBarScreen());
      } on FirebaseAuthException catch (e) {
        loginLoading.value = false;
        if (e.code == 'user-not-found') {
          showSnackBar('Failed!', 'User does not exist', isError: true);
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
