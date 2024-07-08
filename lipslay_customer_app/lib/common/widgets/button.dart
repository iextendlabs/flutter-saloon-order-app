import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/utils/constants/colors.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';

class TButton extends StatelessWidget {
  const TButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = double.infinity, this.height = TSizes.buttonHeight, this.buttonColor = TColors.pinkAccent});

  final String text;
  final double? width;
  final double? height;

  final Color buttonColor;
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

        child: AutoSizeText(
          maxLines: 1,
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: TSizes.fontSizeMd, color: TColors.white),
        ),
      ),
    );
  }
}
