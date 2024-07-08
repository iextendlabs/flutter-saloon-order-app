import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/common/widgets/service_item.dart';
import 'package:lipslay_customer_app/models/offer_product.dart';
import 'package:sizer/sizer.dart';

import '../../models/category.dart';
import '../../utils/constants/sizes.dart';
import '../widgets/category_item.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({
    super.key,
    required this.products,
  });

  final List<OfferProduct> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: SizerUtil.deviceType == DeviceType.mobile
            ? 2
            : 3, // Maximum 3 columns5

        mainAxisExtent: 350,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ServiceItem(product: products[index]);
      },
    );
  }
}
