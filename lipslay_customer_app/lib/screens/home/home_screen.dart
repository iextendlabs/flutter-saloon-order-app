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
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/section_title.dart';
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
      appBar: const CustomAppBar(title: TTexts.appBarTitle,description: TTexts.appBarDescription),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(
              images: controller.images,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
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
            const SectionTitle(title: 'Offers',showIcon: true,icon: Icons.local_offer,),
            ServicesOffer(products: controller.offerProducts),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SectionTitle(title: 'Our Team',showIcon: true,icon: Icons.people,),

            StaffList(staffList: controller.staff),
            const SizedBox(height: TSizes.spaceBtwSections),

          ],
        ),
      ),
    );
  }
}
