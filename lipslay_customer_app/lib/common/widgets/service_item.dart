import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/common/widgets/rating_stars.dart';
import 'package:lipslay_customer_app/common/widgets/wishlisht_button.dart';

import '../../models/offer_product.dart';
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
              Container(
                width: double.infinity,
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                  child: Image.network(
                    product.image,
                    // Use Image.network for direct URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                product.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TSizes.fontSizeMd,
                    height: 1),
              ),
              SizedBox(height: 3),
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
                    onPressed: () {},
                    width: 140,
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