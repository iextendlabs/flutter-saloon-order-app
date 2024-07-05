import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/category.dart';
import '../../utils/constants/sizes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              category.icon,
              width: SizerUtil.deviceType == DeviceType.mobile ? 30.w : 25.w,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4,),
          SizedBox(
            width: 40.w,
            child: AutoSizeText(
              category.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: TSizes.fontSizeSm,
                height: 0.9
              ),
            ),
          ),

        ],
      ),
    );
  }
}
