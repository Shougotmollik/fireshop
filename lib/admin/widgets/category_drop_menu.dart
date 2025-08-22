import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fireshop/admin/controller/admin_add_product_controller.dart';

class CategoryDropMenu extends StatelessWidget {
  const CategoryDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminAddProductController controller =
        Get.find<AdminAddProductController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
        () => DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedValue.value,
          hint: const Text("Select a Category"),
          items: controller.categoryList.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: AppTextStyle.semiBoldTextStyle),
            );
          }).toList(),
          onChanged: (value) {
            controller.selectedValue.value = value;
          },
        ),
      ),
    );
  }
}
