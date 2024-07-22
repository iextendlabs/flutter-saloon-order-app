import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/instance_manager.dart';
import 'package:lipslay_customer_app/common/widgets/custom_image.dart';
import 'package:lipslay_customer_app/controllers/data_controller.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors.dart';

class CarouselSliderWidget extends StatefulWidget {

  const CarouselSliderWidget({super.key, required this.images});
final List<String> images;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
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
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: TSizes.xs),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                    child: CustomImage(
                      url: imageUrl,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10,),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.images.length,
          effect: const ExpandingDotsEffect(
            activeDotColor:TColors.pinkAccent,
            dotColor: TColors.transparentGray,
            expansionFactor: 5,
            spacing: 5,
            dotHeight: 8,
            dotWidth: 8,
          ),
        )
      ],
    );
  }
}
