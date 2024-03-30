import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Cart Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}