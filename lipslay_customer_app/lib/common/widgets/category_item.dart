import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../utils/constants/sizes.dart';
class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.network(
            category.icon,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: TSizes.sm),
        SizedBox(
          width: 120,
          child: Text(
            category.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: TSizes.fontSizeMd,
            ),
          ),
        ),
      ],
    );
  }
}