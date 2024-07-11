import 'package:flutter/material.dart';

import '../../models/offer_product.dart';
import '../../utils/constants/sizes.dart';
import '../widgets/service_item.dart';

class ServicesOffer extends StatelessWidget {
  const ServicesOffer({
    super.key,
    required this.products,
  });

  final List<OfferProduct> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? SizedBox(
            height: 350,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // Set the scroll direction to horizontal
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              itemBuilder: (context, index) {
                return ServiceItem(product: products[index]);
              },
            ),
          )
        : SizedBox.shrink();
  }
}
