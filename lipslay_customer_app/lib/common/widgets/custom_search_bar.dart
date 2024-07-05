import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_bar_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;

  CustomSearchBar({required this.hintText});

  @override
  Widget build(BuildContext context) {
    final SearchBarController controller = Get.put(SearchBarController());

    return Obx(() => Container(
          height: TSizes.searchBarHeight,
          child: TextField(
            controller:
                TextEditingController(text: controller.searchText.value),
            onChanged: (value) => controller.searchText.value = value,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: TColors.gray),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor:  controller.searchText.value.isNotEmpty ? TColors.black : TColors.gray,
              suffixIcon: controller.searchText.value.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black),
                      onPressed: controller.clearSearch)
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: TColors.gray)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: TColors.black)),
              focusColor: TColors.black,
              fillColor: Colors.transparent,
              filled: true,
            ),
            style: TextStyle(
                color: controller.searchText.value.isNotEmpty
                    ? TColors.black
                    : TColors.gray,
                fontSize: TSizes.fontSizeMd),
          ),
        ));
  }
}
