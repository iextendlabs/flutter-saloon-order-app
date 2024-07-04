import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/staff_item.dart';

import 'package:lipslay_customer_app/screens/home/widgets/carousel_slider.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';
import 'package:sizer/sizer.dart';

import '../../common/components/categories_grid.dart';
import '../../common/components/services_offer.dart';
import '../../common/components/statff_list.dart';
import '../../common/widgets/button.dart';
import '../../common/widgets/category_item.dart';
import '../../common/widgets/service_item.dart';
import '../../controllers/data_controller.dart';
import '../../models/staff.dart';
import '../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(TSizes.appBarHeight.h),
        child: AppBar(
          backgroundColor: TColors.primary,
          flexibleSpace: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.appBarTitle,
                  style: TextStyle(fontSize: TSizes.fontSizeXlg),
                ),
                Text(
                  TTexts.appBarDescription,
                  style: TextStyle(fontSize: TSizes.fontSizeMd),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined,size: 34,)),
            SizedBox(width: 12,)
          ],
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
            CategoriesGrid(categories: controller.categories),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.local_offer, size: 32,),
                  SizedBox(width: 10,),
                  Text(
                    'Offers',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ServicesOffer(products: controller.offerProducts),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.people, size: 32,),
                  SizedBox(width: 10,),
                  Text(
                    'Our Team',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            StaffList(staffList: controller.staff),
            const SizedBox(height: TSizes.spaceBtwSections),

          ],
        ),
      ),
    );
  }
}
