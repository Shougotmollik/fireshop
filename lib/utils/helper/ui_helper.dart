//* snack bar
import 'dart:io';

import 'package:fireshop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(String title, String message, {bool isError = false}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: isError ? AppColors.error : AppColors.success,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    snackStyle: SnackStyle.GROUNDED,
    margin: const EdgeInsets.all(0.0),
    icon: Icon(isError ? Icons.error : Icons.check_circle, color: Colors.white),
  );
}

final ImagePicker _picker = ImagePicker();

Future<File?> pickImage() async {
  final XFile? pickedImage = await _picker.pickImage(
    source: ImageSource.gallery,
  );

  if (pickedImage != null) {
    return File(pickedImage.path);
  }

  return null;
}
