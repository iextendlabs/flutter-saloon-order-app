import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    disabledColor: TColors.gray,
    primaryColor: TColors.pink,
    scaffoldBackgroundColor: TColors.primary,
  );
}
