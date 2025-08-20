import 'package:fireshop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;

  const ForgetPasswordButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          btnText,
          style: textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            color: AppColors.success,
          ),
        ),
      ),
    );
  }
}
