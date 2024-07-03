import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lipslay_customer_app/screens/home/widgets/carousel_slider.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';
import 'package:lipslay_customer_app/utils/device/device_utility.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/category_item.dart';
import '../../controllers/data_controller.dart';
import '../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(TSizes.appBarHeight),
        child: AppBar(

          backgroundColor: TColors.primary,
          title: const Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(TTexts.appBarTitle, style: TextStyle(fontSize: TSizes.fontSizeXlg),),
              Text(TTexts.appBarDescription, style: TextStyle(fontSize: TSizes.fontSizeMd),),

            ],
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(
              controller: controller,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: TButton(
                text: TTexts.checkBooking,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: TDeviceUtils.isPhone()? 3 : 4, // Maximum 3 columns5
                  mainAxisExtent: TSizes.gridTileSize,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(category: controller.categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
