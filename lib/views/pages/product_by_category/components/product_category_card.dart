import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/images.dart';
import '../../../../model/product_model.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../product_details/product_details.dart';



class ProductCategoryCard extends StatelessWidget {
  final Product product;
  final TextTheme textTheme;

  const ProductCategoryCard({
    super.key,
    required this.product,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetails(id: product.id.toString()));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black.withOpacity(0.05),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    product.thumbnail ?? AppImages.bg, // Fallback image
                    width: double.infinity,
                    height: SizeConfig.heightMultiplier * 20,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacing.y(2),
                Row(
                  children: [
                    Text(
                      product.title,
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${product.price}',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    ...List.generate(
                      5,
                          (i) => Icon(
                        Icons.star,
                        size: 14,
                        color: i < product.rating.round()
                            ? Colors.amber
                            : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                Spacing.y(1),
                Text(
                  'By ${product.brand ?? "Unknown"}',
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Spacing.y(2),
                Text(
                  product.category,
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Spacing.y(2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
