import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: Center(
        child: Text('Cart Page Content'),
      ),
    );
  }
}