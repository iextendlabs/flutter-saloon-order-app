import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/screens/booking/booking_screen.dart';
import 'package:lipslay_customer_app/screens/home/home_screen.dart';
import 'package:lipslay_customer_app/screens/menu/menu_screen.dart';
import 'package:lipslay_customer_app/screens/search/search_screen.dart';
import 'package:lipslay_customer_app/screens/wishlist/wishlist_screen.dart';
import 'package:lipslay_customer_app/utils/constants/colors.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';

class NavigationMenu extends StatelessWidget {
   NavigationMenu({super.key});
  final controller = Get.put(NavigationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          selectedItemColor: TColors.black,
          unselectedItemColor: TColors.gray,
          backgroundColor: TColors.primary,
          items: [
            _buildBottomNavigationBarItem(Icons.home_rounded, 'Home'),
            _buildBottomNavigationBarItem(Icons.search_rounded, 'Search'),
            _buildBottomNavigationBarItem(Icons.shopping_cart_rounded, 'Cart'),
            _buildBottomNavigationBarItem(Icons.favorite_rounded, 'Wishlist',),
            _buildBottomNavigationBarItem(Icons.calendar_month_rounded, 'Booking'),
            _buildBottomNavigationBarItem(Icons.menu_rounded, 'Menu'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
   BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
     return BottomNavigationBarItem(
       icon: Icon(icon),
       label: label,
       backgroundColor: TColors.primary,
     );
   }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    SearchScreen(),
    Container(
      color: Colors.purple,
    ),
    const WishlistScreen(),

    const BookingScreen(),
    MenuScreen(),

  ];
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
