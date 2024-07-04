import 'package:flutter/material.dart';
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});
final double rating;
  @override
  Widget build(BuildContext context) {
    return buildRatingStars(rating);
  }
  Widget buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(
          Icons.star,
          color: Colors.amber,
        ));
      } else if (i - rating == 0.5) {
        stars.add(const Icon(
          Icons.star_half,
          color: Colors.amber,
        ));
      } else {
        stars.add(const Icon(
          Icons.star_border,
          color: Colors.amber,
        ));
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }
}
