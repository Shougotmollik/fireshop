import 'package:fireshop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Product image
        SizedBox(
          width: double.infinity,
          height: size.height * 0.4,
          child: Image.asset(product.imagePath, fit: BoxFit.cover),
        ),

        // Back button
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(80),
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 22,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
