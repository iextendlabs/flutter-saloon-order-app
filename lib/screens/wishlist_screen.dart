import 'package:flutter/material.dart';
class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: Center(
        child: Text('Wishlist Page Content'),
      ),
    );
  }
}