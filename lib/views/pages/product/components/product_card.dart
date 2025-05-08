import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/model/product_model.dart';
import 'package:test_task/views/pages/product_details/product_details.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
            border: Border.all(color: Colors.black.withOpacity(0.05)),
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
                    product.thumbnail,
                    width: double.infinity,
                    height: SizeConfig.heightMultiplier * 20,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                ),

                Spacing.y(2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        maxLines: 4,
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${product.price.toString()}',
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
                      product.rating.toString(), // 👈 display rating
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 14,
                        color:
                            index < product.rating.round()
                                ? Colors.amber
                                : Colors.grey[300],
                      ),
                    ),
                  ],
                ),

                Spacing.y(1),
                Text(
                  'By ${product.brand}',
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
