import 'package:fireshop/model/category_model.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 4,
          children: [
            Image.asset(
              category.icon,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            Text(category.name, style: AppTextStyle.lightTextStyle),
          ],
        ),
      ),
    );
  }
}
