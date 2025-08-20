import 'package:fireshop/model/product_model.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:fireshop/views/main_nav/home/widgets/custom_elevated_button.dart';
import 'package:fireshop/views/main_nav/home/widgets/product_heading_section.dart';
import 'package:fireshop/views/main_nav/home/widgets/product_image_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductModel;
    return Scaffold(
      backgroundColor: AppColors.productDetailScreenColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSection(product: product),
            const SizedBox(height: 20),
            // Product details section
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    ProductHeadingSection(product: product),
                    const SizedBox(height: 4),
                    Text('Details', style: AppTextStyle.semiBoldTextStyle),
                    Text(
                      product.description,
                      style: AppTextStyle.detailsTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    const Spacer(),
                    CustomElevatedButton(btnText: 'Buy Now', onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
