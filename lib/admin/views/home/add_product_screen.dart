import 'package:fireshop/admin/controller/admin_add_product_controller.dart';
import 'package:fireshop/admin/widgets/category_drop_menu.dart';
import 'package:fireshop/admin/widgets/custom_text_input_field.dart';
import 'package:fireshop/admin/widgets/inser_image_widget.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:fireshop/views/main_nav/home/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminAddProductController controller =
        Get.find<AdminAddProductController>();
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'), centerTitle: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text('Upload product image', style: AppTextStyle.lightTextStyle),
              _buildProductImageSection(controller),
              Text('Product name', style: AppTextStyle.lightTextStyle),
              CustomTextInputFiled(
                controller: controller.productNameTEController,
              ),
              Text('Product Category', style: AppTextStyle.lightTextStyle),
              CategoryDropMenu(),
              Text('Product Description', style: AppTextStyle.lightTextStyle),
              CustomTextInputFiled(
                controller: controller.productDesTEController,
                maxLines: 4,
              ),
              Text('Product Price', style: AppTextStyle.lightTextStyle),
              CustomTextInputFiled(
                controller: controller.productPriceTEController,
              ),
              const SizedBox(height: 12),
              CustomElevatedButton(btnText: 'Add Product', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImageSection(AdminAddProductController controller) {
    return Obx(
      () => controller.selectedImage.value != null
          ? Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  controller.selectedImage.value!,
                  width: 120,
                  height: 120,
                ),
              ),
            )
          : InsertImageWidget(onTap: () => controller.pickFromGallery()),
    );
  }
}
