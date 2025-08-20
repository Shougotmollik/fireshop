import 'package:fireshop/controller/home_controller.dart';
import 'package:fireshop/theme/app_colors.dart';
import 'package:fireshop/utils/helper/app_text_style.dart';
import 'package:fireshop/views/main_nav/home/widgets/category_card.dart';
import 'package:fireshop/views/main_nav/home/widgets/custom_search_bar.dart';
import 'package:fireshop/views/main_nav/home/widgets/heading_text_widget.dart';
import 'package:fireshop/views/main_nav/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              _buildProfileSection(),
              const SizedBox(height: 18),
              CustomSearchBar(hintText: 'Search Products'),
              HeadingTextWidget(headingText: 'Categories', onTap: () {}),
              _buildCategorySection(size, controller),
              HeadingTextWidget(headingText: 'All Products', onTap: () {}),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    ProductCard(product: controller.products[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey,Shougot", style: AppTextStyle.boldTextStyle),
            Text("Good Morning", style: AppTextStyle.lightTextStyle),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/boy.jpg',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(Size size, HomeController controller) {
    return SizedBox(
      height: size.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            CategoryCard(category: controller.categories[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: controller.categories.length,
      ),
    );
  }
}
