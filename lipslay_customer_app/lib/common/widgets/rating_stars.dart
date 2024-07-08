import 'package:flutter/material.dart';
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, this.color = Colors.amber});
final double rating;
final Color color;
  @override
  Widget build(BuildContext context) {
    return buildRatingStars(rating,color);
  }
  Widget buildRatingStars(double rating,Color color) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add( Icon(
          Icons.star,
          color:color,
        ));
      } else if (i - rating == 0.5) {
        stars.add( Icon(
          Icons.star_half,
          color:color,
        ));
      } else {
        stars.add( Icon(
          Icons.star_border,
          color: color,
        ));
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }
}
