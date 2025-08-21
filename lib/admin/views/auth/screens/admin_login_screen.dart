import 'package:fireshop/admin/controller/admin_auth_controller.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:fireshop/utils/helper/form_validator.dart';
import 'package:fireshop/views/auth/screens/widgets/auth_text_form_filed.dart';
import 'package:fireshop/views/main_nav/home/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final FormValidator formValidator = FormValidator();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AdminAuthController controller = Get.find<AdminAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.productDetailScreenColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset('assets/images/login.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        spacing: 8,
                        children: [
                          Text(
                            'Admin Panel',
                            style: AppTextStyle.semiBoldTextStyle.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Please fill the form with your admin panel credential',
                            style: AppTextStyle.lightTextStyle.copyWith(
                              color: Colors.red.shade200,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Text('User Name', style: AppTextStyle.semiBoldTextStyle),
                    AuthTextFormField(
                      hintText: 'Enter your admin username',
                      prefixIcon: Icons.person_4_rounded,
                      textEditingController: controller.nameTEController,
                    ),
                    Text('Password', style: AppTextStyle.semiBoldTextStyle),
                    AuthTextFormField(
                      hintText: 'Enter your admin password',
                      prefixIcon: Icons.lock_open_outlined,
                      textEditingController: controller.passwordTEController,
                      showToggle: true,
                      validator: formValidator.validatePassword,
                    ),
                    SizedBox(height: 38),
                    Obx(
                      () => CustomElevatedButton(
                        btnText: controller.loginLoading.value
                            ? 'Loading..'
                            : 'Sign In',
                        onTap: _signInButton,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signInButton() {
    formValidator.validateAndProceed(formKey, () {
      controller.adminLogin(
        userName: controller.nameTEController.text,
        password: controller.passwordTEController.text,
      );
    });
  }
}
