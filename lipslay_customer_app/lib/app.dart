import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/utils/theme/theme.dart';
import 'package:sizer/sizer.dart';
import  'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;

import 'navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(

        supportedLocales: flc.CountryLocalizations.supportedLocales.map(Locale.new),
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        home: NavigationMenu(),
      );
    });
  }
}
