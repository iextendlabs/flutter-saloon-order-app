import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/wishlisht_button.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: TTexts.appBarWishlistScreenTitle,
          description: TTexts.appBarWishlistScreenDescription),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
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
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(TSizes.borderRadiusMd),
                            child: Image.network(
                              'https://picsum.photos/200/300', //product.image,
                              // Use Image.network for direct URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: WishlistButton(),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            'Testing product', //product.name,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: TSizes.fontSizeMd,
                                height: 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AED ', //${product.price}',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        TButton(
                          text: 'Add to Cart',
                          onPressed: () {},
                          width: 160,
                          height: 35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
