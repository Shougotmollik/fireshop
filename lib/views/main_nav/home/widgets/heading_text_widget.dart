import 'package:fireshop/theme/app_colors.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:flutter/material.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({
    super.key,
    required this.headingText,
    required this.onTap,
  });

  final String headingText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headingText, style: AppTextStyle.semiBoldTextStyle),
        TextButton(
          onPressed: onTap,
          child: Text(
            'View all',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
