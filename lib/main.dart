import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'screens/home_screen.dart';
import 'screens/my_bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LipSlay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pinkAccent,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}
