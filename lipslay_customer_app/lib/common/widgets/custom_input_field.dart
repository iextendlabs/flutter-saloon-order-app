import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
final TextInputType keyboardType;
  const CustomTextField({super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TColors.gray),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TColors.black),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TColors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TColors.red),
          ),
        ),
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}