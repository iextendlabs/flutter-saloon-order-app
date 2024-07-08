import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, this.showIcon = false, this.icon = Icons.shape_line_rounded,  this.padding = const EdgeInsets.only(left: TSizes.md),
  });
  final String title;
  final bool showIcon;
  final IconData icon;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showIcon ? Icon(icon, size: 22,):const SizedBox.shrink(),
          const SizedBox(width: 8,),
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
