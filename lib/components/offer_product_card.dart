import 'package:flutter/material.dart';
import 'package:saloon/models/RatingStars.dart';

class OfferProduct {
  final String image;
  final String name;
  final double rating;
  final String price;
  final String discount;
  final String duration;

  OfferProduct({
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.discount,
    required this.duration,
  });

  factory OfferProduct.fromJson(Map<String, dynamic> json) {
    String baseUrl = 'https://lipslay.com/service-images/';
    return OfferProduct(
      image: baseUrl + (json['image'] ?? ''),
      name: json['name'] ?? '',
      rating: json['rating'] != null ? double.parse(json['rating']) : 0.0,
      price: json['price'] ?? '0',
      discount: json['discount'] ?? '0',
      duration: json['duration'] ?? '',
    );
  }
}

class OfferProductCard extends StatelessWidget {
  final OfferProduct offerProduct;

  OfferProductCard({required this.offerProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductViewPage(product: offerProduct),
        //   ),
        // );
      },
      child: Container(
        width: 250.0,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0), // Add margin to the top of the image
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.network(
                        offerProduct.image, // Use Image.network instead of Image.asset
                        width: 230.0,
                        height: 155.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add to Wishlist
                      },
                      icon: Icon(Icons.favorite_border, color: Colors.white), // Set icon color to white
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      offerProduct.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingStars(rating: offerProduct.rating), // Use RatingStars component here
                        SizedBox(width: 4.0),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'AED ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (double.parse(offerProduct.discount) > 0.0) ...[
                              Text(
                                offerProduct.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                offerProduct.discount,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ] else ...[
                              Text(
                                offerProduct.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey[700]),
                            SizedBox(width: 4.0),
                            Text(
                              offerProduct.duration,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Book Now
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
