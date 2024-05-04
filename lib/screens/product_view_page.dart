import 'package:flutter/material.dart';

class OfferProduct {
  final String image;
  final String name;
  final double rating;
  final double price;
  final String duration;

  OfferProduct({
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.duration,
  });
}
class ProductViewPage extends StatelessWidget {
  final OfferProduct product;

  ProductViewPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.image,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            Text(
              'Price: ${product.price}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Rating: ${product.rating}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Duration: ${product.duration}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
