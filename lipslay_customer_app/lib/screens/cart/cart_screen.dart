import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lipslay_customer_app/common/widgets/round_icon_button.dart';
import 'package:lipslay_customer_app/screens/cart/checkout_screen.dart';
import 'package:lipslay_customer_app/screens/cart/widgets/cart_item.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/wishlisht_button.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: TTexts.appBarShoppingCartScreenTitle,
          description: TTexts.appBarShoppingCartScreenDescription),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80,left: 16,right: 10),
          child: Column(
            children: [
              CartItem(),
              CartItem(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TButton(text: 'Checkout',onPressed: (){
          Get.to(()=>CheckoutScreen());
        },),
      ),
    );
  }
}
