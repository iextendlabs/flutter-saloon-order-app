import 'package:flutter/material.dart';
import '../components/carousel_slider.dart';
import '../components/category_grid.dart';
import '../components/offer_product_card.dart';
import '../components/bottom_navigation_bar.dart';
import '../models/category.dart';
import '../models/offer_product.dart';

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

class OfferProduct {
  final String name;
  final String image;
  final double rating;
  final String price;
  final String duration;

  OfferProduct({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.duration,
  });
}

class HomePage extends StatelessWidget {
  final List<String> images = [
    'images/slider/1948121663.png',
    'images/slider/1948121663.png',
    'images/slider/1948121663.png',
  ];

  final List<Category> categories = [
    Category(
      title: 'Bleach & Threading',
      image: 'images/category/Bleach.png',
    ),
    Category(
      title: 'Facial',
      image: 'images/category/Facial.png',
    ),
    Category(
      title: 'Hair',
      image: 'images/category/Hair.png',
    ),
    Category(
      title: 'Henna',
      image: 'images/category/Henna.png',
    ),
    Category(
      title: 'Makeup',
      image: 'images/category/Makup.png',
    ),
    Category(
      title: 'Manicure-Pedicure',
      image: 'images/category/Manicure.png',
    ),
    Category(
      title: 'Henna',
      image: 'images/category/Henna.png',
    ),
    Category(
      title: 'Makeup',
      image: 'images/category/Makup.png',
    ),
    Category(
      title: 'Manicure-Pedicure',
      image: 'images/category/Manicure.png',
    ),
  ];

  final List<OfferProduct> offerProducts = [
    OfferProduct(
      name: 'Anti Acne Facial',
      image: 'images/product/1693666565.png',
      rating: 4.5,
      price: '\AED149.00',
      duration: '45 MINS',
    ),
    OfferProduct(
      name: 'Asta Berry Gold Facial',
      image: 'images/product/1693662703.png',
      rating: 4.0,
      price: '\AED99.00',
      duration: '45 MINS',
    ),
    OfferProduct(
      name: 'Asta Berry Whitening Facial',
      image: 'images/product/1693663354.png',
      rating: 4.8,
      price: '\AED99.00',
      duration: '45 MINS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('LipSlay Home Services'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSliderWidget(images: images),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Check Booking page
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              ),
              child: Text(
                'Check Booking',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
            CategoryGridWidget(categories: categories),
            SizedBox(height: 20.0),
            OfferProductListWidget(offerProducts: offerProducts),
          ],
        ),
      ),
    );
  }
}
