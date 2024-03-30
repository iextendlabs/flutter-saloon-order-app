import 'package:flutter/material.dart';
class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Wishlist Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}