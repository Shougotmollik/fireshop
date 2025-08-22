import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fireshop/utils/helper/ui_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AdminAddProductController extends GetxController {
  final TextEditingController productNameTEController = TextEditingController();
  final TextEditingController productDesTEController = TextEditingController();
  final TextEditingController productPriceTEController =
      TextEditingController();

  final List<String> categoryList = [
    'Headphone',
    'Watch',
    'Mobile',
    'Television',
    'Laptop',
  ].obs;
  var selectedValue = RxnString();

  // Image selection
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickFromGallery() async {
    File? image = await pickImage();
    if (image != null) {
      selectedImage.value = image;
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage.value != null &&
        productPriceTEController.text.isNotEmpty &&
        productNameTEController.text.isNotEmpty &&
        productDesTEController.text.isNotEmpty) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseReference = FirebaseStorage.instance
          .ref()
          .child('blogImage')
          .child(addId);
    }
  }

  @override
  void dispose() {
    productNameTEController.dispose();
    productDesTEController.dispose();
    productPriceTEController.dispose();
    super.dispose();
  }
}
