import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/widgets/text_field.dart';
import '../../../controllers/product.dart';
import 'components/product_card.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProductController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: Column(
        children: [
          Spacing.y(5),
          Center(
            child: Text(
              'Products',
              style: textTheme.labelMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "PlayfairDisplay",
              ),
            ),
          ),
          Spacing.y(2),
          AppTextField(onChanged: controller.searchProducts),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color:Colors.black));
              }

              if (controller.products.isEmpty) {
                return const Center(child: Text('No products found'));
              }

              return ListView.builder(
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return ProductCard(product: product);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
