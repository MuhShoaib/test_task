import 'package:flutter/material.dart';

import '../../../../controllers/product.dart';
import '../../../../model/product_model.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';

class FavCard extends StatelessWidget {
  final Product product;
  final TextTheme textTheme;
  final ProductController controller;

  const FavCard({
    super.key,
    required this.product,
    required this.textTheme,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 3,
          vertical: SizeConfig.heightMultiplier * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                product.thumbnail,
                width: SizeConfig.widthMultiplier * 16,
                height: SizeConfig.widthMultiplier * 16,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: SizeConfig.widthMultiplier * 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacing.y(0.5),
                  Text(
                    "\$${product.price}",
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacing.y(0.5),
                  Row(
                    children: [
                      Text(
                        product.rating.toString(),
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
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                controller.toggleFavorite(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
