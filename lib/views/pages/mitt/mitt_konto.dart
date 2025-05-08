import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/constants/images.dart';
import 'package:test_task/controllers/category.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/views/pages/product_by_category/product_by_category.dart';
import 'package:test_task/widgets/text_field.dart';

class MittKonto extends StatelessWidget {
  const MittKonto({super.key});

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
              'Mitt Konto',
              style: textTheme.labelMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "PlayfairDisplay",
              ),
            ),
          ),
          Spacing.y(4),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5,
              vertical: SizeConfig.heightMultiplier * 1.5,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 30, backgroundColor: Colors.white),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 4,
                ), // spacing between image & text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Muhammad Shoaib",
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacing.y(0.5),
                      Text(
                        "2016n5714@gmail.com",
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacing.y(0.5),
                      Text(
                        "03120690030",
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Spacing.y(5),
          buildRow(textTheme, "Kontoinstallningar", Icons.settings),
          Spacing.y(2),
          buildRow(textTheme, "Mina betalmetoder", Icons.payments),
          Spacing.y(2),
          buildRow(textTheme, "Support", Icons.support),
        ],
      ),
    );
  }
}

Widget buildRow(TextTheme textTheme, String label, IconData value) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
    child: Row(
      children: [
        Icon(value, color: Colors.black),
        Spacing.x(4),
        Text(
          label,
          style: textTheme.labelMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
