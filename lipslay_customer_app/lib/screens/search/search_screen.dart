import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:lipslay_customer_app/common/widgets/custom_app_bar.dart';
import 'package:lipslay_customer_app/common/widgets/custom_search_bar.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';
import '../../common/components/services_grid.dart';
import '../../controllers/data_controller.dart';
import '../../models/offer_product.dart';
import '../../utils/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, this.categoryId = -1});

  final int categoryId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  final DataController _controller = Get.find<DataController>();
  RxList<OfferProduct> searchedProducts = <OfferProduct>[].obs;
}

class _SearchScreenState extends State<SearchScreen> {
  Rx<String> searchedText=''.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.searchedProducts.clear();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: TTexts.appBarSearchScreenTitle,
          description: TTexts.appBarSearchScreenDescription),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchBar(
                hintText: TTexts.searchServicesHint,
                onChanged: (value) {
                  if (value.length > 2) {
                    widget.searchedProducts.value =
                        widget._controller.filterServicesByName(value);
                  } else {
                    widget.searchedProducts.clear();
                  }
                },
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Obx(()=>ServicesGrid(products: widget.searchedProducts.toList())),
          ],
        ),
      ),
    );
  }
}
