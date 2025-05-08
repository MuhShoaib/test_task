import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/constants/images.dart';
import 'package:test_task/controllers/category.dart';
import 'package:test_task/model/product_model.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/views/pages/product_details/product_details.dart';
import 'package:test_task/widgets/text_field.dart';

import 'components/product_category_card.dart';

class ProductByCategory extends StatelessWidget {
  final String categoryName;

  const ProductByCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(CategoryController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductsByCategory(categoryName);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5,
        ),
        child: Column(
          children: [
            Spacing.y(5),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () => Get.back(),
                ),
                const Spacer(),
                Text(
                  categoryName,
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                const Spacer(),
              ],
            ),
            Spacing.y(2),
            AppTextField(onChanged: controller.searchProductsByCategory),

            Obx(() {
              if (controller.isLoading.value) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                );
              }

              if (controller.filteredProducts.isEmpty) {
                return const Expanded(
                  child: Center(child: Text('No products found')),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.filteredProducts[index];

                    return ProductCategoryCard(
                      product: product,
                      textTheme: textTheme,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
