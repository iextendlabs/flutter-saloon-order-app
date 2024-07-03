import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/instance_manager.dart';
import 'package:lipslay_customer_app/controllers/data_controller.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';

class CarouselSliderWidget extends StatelessWidget {

  const CarouselSliderWidget({super.key, required this.controller});
final DataController controller;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // Placeholder options, replace with your desired options
        height: TSizes.imageCarouselHeight,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: controller.images.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: TSizes.xs),
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                child: Image.network(
                  imageUrl, // Use Image.network for direct URL
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
