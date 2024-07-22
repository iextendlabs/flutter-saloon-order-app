import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/common/widgets/round_icon_button.dart';
import 'package:lipslay_customer_app/screens/cart/widgets/cart_item.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/custom_input_field.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Checkout',
          description: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80, left: 16, right: 10),
          child: Column(
            children: [
              CartItem(
                canEdit: true,
              ),
              CartItem(
                canEdit: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              CustomTextField(
                labelText: 'Enter Coupon Code (Optional)',
                hintText: 'Enter Coupon Code',
                prefixIcon: const Icon(Icons.discount_outlined),
                keyboardType: TextInputType.name,
                // onSaved: (value) => signUpController.name.value = value!,
                //validator: (value) => signUpController.validateName(value!),
              ),
              CustomTextField(
                labelText: 'Enter Affiliate Code (Optional)',
                hintText: 'Enter Affiliate Code',
                prefixIcon: const Icon(Icons.handshake_outlined),
                keyboardType: TextInputType.name,
                // onSaved: (value) => signUpController.name.value = value!,
                //validator: (value) => signUpController.validateName(value!),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TButton(text: 'Apply', onPressed: () {}),
              SizedBox(height: TSizes.spaceBtwSections),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(height: TSizes.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Info",
                    style: TextStyle(
                        fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                ],
              ),
              IconWithTextBar(iconData: Icons.person,title: 'Person Name'),
              IconWithTextBar(iconData: Icons.email,title: 'mail@mail.com',),
              IconWithTextBar(iconData: Icons.recent_actors,title: 'Male',),
              IconWithTextBar(iconData: Icons.phone,title: '+35324534534',),
              IconWithTextBar(iconData: Icons.message,title: '+2345324534',),
              SizedBox(height: TSizes.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                        fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                ],
              ),
              Text(
                'This is same address , dsdglkasd sdkfjasdjfk sadjnf asdjhf ajh',
                style: TextStyle(fontSize: TSizes.fontSizeSm),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(height: TSizes.spaceBtwSections),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                      fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: TSizes.sm),
              OrderSummaryItem(title: 'Total Services Charges', price: 'AED 345'),
              OrderSummaryItem(title: 'Coupon Discount', price: 'AED 345'),
              OrderSummaryItem(title: 'Staff Charges', price: 'AED 345'),
              OrderSummaryItem(title: 'Transport Charges', price: 'AED 345'),
              Divider(color: TColors.gray),
              OrderSummaryItem(title: 'Total Charges', price: 'AED 345'),
              SizedBox(height: TSizes.sm),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(height: TSizes.spaceBtwSections),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Note",
                  style: TextStyle(
                      fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter your notes',
                    labelText: 'Enter your notes',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              TButton(text: 'Place Order', onPressed: (){}),
              SizedBox(height: TSizes.spaceBtwSections),

              TButton(text: 'Customer Support', onPressed: (){},buttonColor: TColors.blue,)
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({
    super.key, required this.title, required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: TSizes.fontSizeSm),
          ),
          Text(
            price,
            style: TextStyle(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class IconWithTextBar extends StatelessWidget {
  const IconWithTextBar({
    super.key, required this.iconData, required this.title,
  });
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: TSizes.spaceBtwItems),
          Text(
            title,
            style: TextStyle(fontSize: TSizes.fontSizeSm),
          ),
        ],
      ),
    );
  }
}
