import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/screens/notifications/notifications_screen.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.preferredSize = const Size.fromHeight(TSizes.appBarHeight),
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: TColors.primary,
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: TSizes.fontSizeLg),
              ),
              description.length > 0
                  ? Text(description,
                      style: const TextStyle(fontSize: TSizes.fontSizeSm))
                  : SizedBox.shrink(),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => NotificationsScreen());
              },
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 32,
              )),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
