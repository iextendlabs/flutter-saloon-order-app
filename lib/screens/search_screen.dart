import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Search Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}