import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lipslay_customer_app/common/widgets/custom_app_bar.dart';
import 'package:lipslay_customer_app/config/api_urls.dart';
import 'package:lipslay_customer_app/screens/auth/sign_in_screen.dart';
import 'package:lipslay_customer_app/screens/auth/sign_up_screen.dart';
import 'package:lipslay_customer_app/screens/webview/webview_screen.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';

import '../../common/widgets/menu_button.dart';
import '../../controllers/data_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: TTexts.appBarMenuScreenTitle,
          description: TTexts.appBarMenuScreenDescription,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                MenuButton(
                  text: 'Profile',
                  onPressed: () {
                    Get.to(() => SignInScreen());
                  },
                ),
                const Divider(height: 0, color: TColors.gray),
                MenuButton(
                  text: 'My Bookings',
                  onPressed: () {},
                ),
                const Divider(height: 0, color: TColors.gray),
                MenuButton(
                  text: 'Terms & Condition',
                  onPressed: () {
                    Get.to(() => WebviewScreen(
                        title: 'Terms & Condition',
                        url: ApiUrls.termsConditionUrl));
                  },
                ),
                const Divider(height: 0, color: TColors.gray),
                MenuButton(
                  text: 'Privacy Policy',
                  onPressed: () {
                    Get.to(() => WebviewScreen(
                        title: 'Privacy Policy',
                        url: ApiUrls.privacyPolicyUrl));
                  },
                ),
                const Divider(height: 0, color: TColors.gray),
                MenuButton(
                  text: 'About Us',
                  onPressed: () {
                    Get.to(() => WebviewScreen(
                        title: 'About Us', url: ApiUrls.aboutUsUrl));
                  },
                ),
                const Divider(height: 0, color: TColors.gray),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.category_rounded,
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: TSizes.fontSizeLg,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // Set the scroll direction to horizontal
                  itemCount: controller.categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MenuButton(
                            text: controller.categories[index].title,
                            onPressed: () {}),
                        const Divider(height: 0, color: TColors.gray),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
