import 'package:flutter/material.dart';
import '../models/offer_product.dart';
import '../components/offer_product_card.dart';

class OfferProductListWidget extends StatelessWidget {
  final List<OfferProduct> offerProducts;

  OfferProductListWidget({required this.offerProducts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Offers',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 200.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: offerProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OfferProductCard(offerProduct: offerProducts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
