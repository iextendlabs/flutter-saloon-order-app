import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/button.dart';
import 'package:lipslay_customer_app/controllers/auth_controllers/forgot_password_controller.dart';
import 'package:lipslay_customer_app/controllers/auth_controllers/sign_in_controller.dart';
import 'package:lipslay_customer_app/screens/auth/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

import '../../common/widgets/custom_input_field.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage(Assets.iconTransparent), height: 80),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Center(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: TSizes.fontSizeXlg,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItemsSmall),
            Form(
                child: Column(
              children: [
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => forgotPasswordController.email.value = value!,
                  validator: (value) =>
                      forgotPasswordController.validateEmail(value!),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TButton(text: 'Submit', onPressed: () {}),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
