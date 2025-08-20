import 'package:fireshop/model/product_model.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductHeadingSection extends StatelessWidget {
  const ProductHeadingSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.75,
          child: Text(
            product.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Text(
          "\$${product.price}",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}