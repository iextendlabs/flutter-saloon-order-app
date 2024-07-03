import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/utils/theme/theme.dart';
import 'package:sizer/sizer.dart';

import 'navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            themeMode: ThemeMode.system,
            theme: TAppTheme.lightTheme,
            home: NavigationMenu(),
          );        }
    );

  }
}
