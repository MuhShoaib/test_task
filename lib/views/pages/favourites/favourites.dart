import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/widgets/text_field.dart';

import '../../../controllers/product.dart';
import 'components/fav_card.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<ProductController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: Column(
        children: [
          Spacing.y(5),
          Center(
            child: Text(
              'Favourites',
              style: textTheme.labelMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "PlayfairDisplay",
              ),
            ),
          ),
          Spacing.y(2),
          AppTextField(onChanged: controller.searchFavoriteProducts),

          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.filteredFavProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.filteredFavProducts[index];

                  return FavCard(
                    product: product,
                    textTheme: textTheme,
                    controller: controller,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
