import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/check_booking_screen.dart';
import '../screens/menu_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CartPage(),
    WishlistPage(),
    CheckBookingPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0), // Add top margin after border
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              buildBottomNavigationBarItem(Icons.home, 'Home'),
              buildBottomNavigationBarItem(Icons.search, 'Search'),
              buildBottomNavigationBarItem(Icons.shopping_cart, 'Cart'),
              buildBottomNavigationBarItem(Icons.favorite, 'Wishlist'),
              buildBottomNavigationBarItem(Icons.calendar_today, 'Calendar'),
              buildBottomNavigationBarItem(Icons.menu, 'Menu'),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Color(0xFFfdc8cd),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: Color(0xFFfdc8cd),
    );
  }
}
