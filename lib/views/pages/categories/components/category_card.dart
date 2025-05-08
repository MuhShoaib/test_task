import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/images.dart';
import '../../../../model/category_model.dart';
import '../../../../utils/size_config.dart';
import '../../product_by_category/product_by_category.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final TextTheme textTheme;

  const CategoryCard({
    super.key,
    required this.category,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductByCategory(categoryName: category.name));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.asset(
                  AppImages.bg,
                  width: double.infinity,
                  height: SizeConfig.heightMultiplier * 20,
                  fit: BoxFit.cover,
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: SizeConfig.heightMultiplier * 2.5,
                  left: SizeConfig.widthMultiplier * 3,
                  right: SizeConfig.widthMultiplier * 3,
                  child: Text(
                    category.name,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
