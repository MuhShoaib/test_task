import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';

import '../../../controllers/product.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProductController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductDetails(id);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        }

        final product = controller.selectedProduct.value;
        if (product == null) {
          return const Center(child: Text('No product found.'));
        }

        final isFavorite = controller.isFavorite(product);

        return Column(
          children: [
            Spacing.y(5),
            Center(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Spacer(),
                  Text(
                    'Product Details',
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
            ),
            Spacing.y(2),
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                product.thumbnail,
                width: double.infinity,
                height: SizeConfig.heightMultiplier * 25,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.y(2),
                  Row(
                    children: [
                      Text(
                        'Product Details',
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          controller.toggleFavorite(
                            product,
                          ); // Toggle favorite status
                        },
                      ),
                    ],
                  ),
                  Spacing.y(1),
                  buildRow(textTheme, 'Name:', product.title),
                  Spacing.y(1),
                  buildRow(textTheme, 'Price:', '\$${product.price}'),
                  Spacing.y(1),
                  buildRow(textTheme, 'Category:', product.category),
                  Spacing.y(1),

                  Row(
                    children: [
                      Text(
                        "Rating:",
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Spacing.x(2),
                      Text(
                        product.rating.toString(),
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
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
                  buildRow(textTheme, 'Stock:', product.stock.toString()),
                  Spacing.y(1),
                  Text(
                    'Description:',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    product.description,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Spacing.y(2),
                  Row(
                    children: [
                      Text(
                        'Product Gallery:',
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),

                  MasonryGridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    itemCount: product.images.length,
                    itemBuilder: (context, index) {
                      final imageUrl = product.images[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      );
                    },
                  ),
                  Spacing.y(2),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildRow(TextTheme textTheme, String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: textTheme.labelMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Spacing.x(2),
        Expanded(
          child: Text(
            value,
            style: textTheme.labelMedium!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
