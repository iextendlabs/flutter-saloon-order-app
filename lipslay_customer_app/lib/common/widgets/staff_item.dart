import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/common/widgets/rating_stars.dart';

import '../../config/api_urls.dart';
import '../../models/staff.dart';
import '../../utils/constants/sizes.dart';

class StaffItem extends StatelessWidget {
  const StaffItem({super.key, required this.staff});

  final Staff staff;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      '${ApiUrls.baseUrl}staff-images/${staff.imageUrl}'),
                  // Use NetworkImage for network URLs
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              staff.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeMd,
                  height: 1),
            ),
            AutoSizeText(
              staff.subTitle,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: TSizes.fontSizeMd),
            ),
            staff.charges.isNotEmpty && staff.charges != '0'
                ? AutoSizeText(
                    'Extra Charges: AED ${staff.charges}',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14.0,
                        height: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingStars(rating: staff.rating),
                // Use RatingStars component here
                const SizedBox(width: 4.0),
              ],
            ),
            const SizedBox(height: 3)
          ],
        ),
      ),
    );
    ;
  }
}
