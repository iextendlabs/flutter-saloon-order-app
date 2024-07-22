import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        fixedSize: Size.fromHeight(100),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeMd, color: TColors.black),
            ),
            SizedBox(height: 10),
            Text(
              'There is new voucher for you',
              style: const TextStyle(
                  fontSize: TSizes.fontSizeSm, color: TColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
