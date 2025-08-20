import 'package:fireshop/controller/auth_controller.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:fireshop/utils/helper/form_validator.dart';
import 'package:fireshop/views/auth/screens/login_screen.dart';
import 'package:fireshop/views/auth/screens/widgets/auth_text_form_filed.dart';
import 'package:fireshop/views/auth/screens/widgets/rich_text_widget.dart';
import 'package:fireshop/views/main_nav/home/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController controller = Get.find<AuthController>();
  final FormValidator formValidator = FormValidator();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    Text(
                      'Please fill the form with your details for registration',
                      style: AppTextStyle.lightTextStyle,
                    ),
                    Text('Name', style: AppTextStyle.semiBoldTextStyle),
                    AuthTextFormField(
                      hintText: 'Enter your Full Name',
                      prefixIcon: Icons.person,
                      textEditingController: controller.nameTEController,
                      validator: formValidator.validateName,
                    ),
                    Text('Email', style: AppTextStyle.semiBoldTextStyle),
                    AuthTextFormField(
                      hintText: 'Enter your email Address',
                      prefixIcon: Icons.email_outlined,
                      textEditingController: controller.emailTEController,
                      validator: formValidator.validateEmail,
                    ),
                    Text('Password', style: AppTextStyle.semiBoldTextStyle),
                    AuthTextFormField(
                      hintText: 'Enter your Password',
                      prefixIcon: Icons.lock_open_outlined,
                      textEditingController: controller.passwordTEController,
                      showToggle: true,
                      validator: formValidator.validatePassword,
                    ),
                    SizedBox(height: 18),
                    Obx(
                      () => CustomElevatedButton(
                        btnText: controller.regiLoading.value
                            ? 'Loading...'
                            : 'Sign Up',
                        onTap: _signUpButton,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildSignUpSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUpButton() {
    formValidator.validateAndProceed(formKey, () {
      controller.registration(
        controller.nameTEController.text,
        controller.emailTEController.text,
        controller.passwordTEController.text,
      );
    });
  }

  Widget _buildSignUpSection() {
    return Align(
      alignment: Alignment.center,
      child: RichTextWidget(
        firstText: "Already have an account? ",
        secondText: 'Sign In',
        onTap: () => Get.offAll(LoginScreen()),
      ),
    );
  }
}
