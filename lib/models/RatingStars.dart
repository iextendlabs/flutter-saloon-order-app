import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return _buildStarIcon(rating);
  }

  Widget _buildStarIcon(double rating) {
    List<Widget> stars = [];
    int filledStars = rating.floor();
    bool hasHalfStar = rating - filledStars >= 0.5;

    for (int i = 0; i < filledStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.black, size: 18.0));
    }

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: Colors.black, size: 18.0));
    }

    // Add remaining stars (if any) to reach a total of 5 stars
    int remainingStars = 5 - stars.length;
    for (int i = 0; i < remainingStars; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.black, size: 18.0));
    }

    return Row(children: stars);
  }
}
