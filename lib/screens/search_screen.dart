import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: Center(
        child: Text('Search Page Content'),
      ),
    );
  }
}