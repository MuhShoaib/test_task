import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/controllers/category.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/widgets/text_field.dart';

import 'components/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(CategoryController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: Column(
        children: [
          Spacing.y(5),
          Center(
            child: Text(
              'Categories',
              style: textTheme.labelMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "PlayfairDisplay",
              ),
            ),
          ),
          Spacing.y(2),
          AppTextField(onChanged: controller.searchCategories),

          Obx(() {
            if (controller.isLoading.value) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              );
            }

            return Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: controller.filteredCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: SizeConfig.widthMultiplier * 2,
                    crossAxisSpacing: SizeConfig.widthMultiplier * 6,
                  ),
                  itemBuilder: (context, index) {
                    final category = controller.filteredCategory[index];
                    return CategoryCard(
                      category: category,
                      textTheme: textTheme,
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
