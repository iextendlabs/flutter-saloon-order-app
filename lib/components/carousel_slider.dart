import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> images;

  CarouselSliderWidget({required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          // Carousel options
        ),
        items: images.map((assetPath) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
