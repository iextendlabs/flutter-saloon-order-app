import 'package:flutter/material.dart';
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Menu Page Content',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}