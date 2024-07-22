import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/custom_image.dart';
import 'package:lipslay_customer_app/common/widgets/rating_stars.dart';
import 'package:lipslay_customer_app/common/widgets/wishlisht_button.dart';
import 'package:lipslay_customer_app/screens/cart/add_to_cart_screen.dart';
import 'package:lipslay_customer_app/screens/home/product_detail_screen.dart';

import '../../models/offer_product.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.product,
  });

  final OfferProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 260,
        height: 320,
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailScreen(productId: product.id),
                      preventDuplicates: false);
                },
                child: Container(
                  width: double.infinity,
                  height: 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                    child: CustomImage(
                      url: product.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                product.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TSizes.fontSizeMd,
                    height: 1),
              ),
              const SizedBox(height: 3),
              RatingStars(rating: product.rating),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AED ${product.price}',
                    style: TextStyle(fontSize: TSizes.fontSizeSm),
                  ),
                  Text(
                    product.duration,
                    style: TextStyle(fontSize: TSizes.fontSizeSm),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TButton(
                    text: 'Book Now',
                    onPressed: () {
                      Get.to(() => AddToCartScreen());
                    },
                    width: 110,
                    height: 45,
                  ),
                  WishlistButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
