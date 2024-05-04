import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'screens/home_screen.dart';
import 'components/bottom_navigation_bar.dart';

Color customColor = Color(0xFFfdc8cd);

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
        scaffoldBackgroundColor: customColor,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}
