import 'package:flutter/material.dart';
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: Center(
        child: Text('Menu Page Content'),
      ),
    );
  }
}