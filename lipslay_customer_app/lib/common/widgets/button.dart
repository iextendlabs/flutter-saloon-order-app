import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/utils/constants/colors.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';
class TButton extends StatelessWidget {
  const TButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Color buttonColor = TColors.pinkAccent;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
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
          style: const TextStyle(fontSize: TSizes.fontSizeLg, color: TColors.white),
        ),
      ),
    );
  }
}
