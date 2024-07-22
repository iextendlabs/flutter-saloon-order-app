import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/round_icon_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, this.canEdit = false,
  });
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: double.infinity,
        height: 220,
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
                    height: 120,
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
                    right: 7,
                    top: 7,
                    child:
                        canEdit? RoundIconButton(onPressed: (){},iconData: Icons.edit,):
                    RoundIconButton(
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.sm),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Testing product', //product.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: TSizes.fontSizeMd,
                        height: 1),
                  ),
                  Text(
                    'AED ', //${product.price}',
                    style: TextStyle(fontSize: TSizes.fontSizeSm),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Instructor Name', //product.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(fontSize: TSizes.fontSizeSm, height: 1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          Text(
                            '09-07-2024', //${product.price}',
                            style: TextStyle(fontSize: TSizes.fontSizeSm),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text(
                            '06:45 PM-10:45 PM', //${product.price}',
                            style: TextStyle(fontSize: TSizes.fontSizeSm),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
