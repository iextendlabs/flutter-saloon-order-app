import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/utils/constants/colors.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';

class TButton extends StatelessWidget {
  const TButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = double.infinity, this.height = TSizes.buttonHeight});

  final String text;
  final double? width;
  final double? height;

  final Color buttonColor = TColors.pinkAccent;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: TSizes.fontSizeLg, color: TColors.white),
        ),
      ),
    );
  }
}
