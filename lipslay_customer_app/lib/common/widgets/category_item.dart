import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lipslay_customer_app/screens/home/category_detail_screen.dart';
import 'package:lipslay_customer_app/screens/search/search_screen.dart';
import 'package:sizer/sizer.dart';

import '../../models/category.dart';
import '../../utils/constants/sizes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>CategoryDetailScreen(category: category),
            preventDuplicates: false
        );
      },
      child: Container(
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                category.icon,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 120,
              child: AutoSizeText(
                category.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: TSizes.fontSizeSm, height: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
