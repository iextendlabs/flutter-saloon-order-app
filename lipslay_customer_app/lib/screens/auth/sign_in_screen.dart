import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/button.dart';
import 'package:lipslay_customer_app/controllers/auth_controllers/sign_in_controller.dart';
import 'package:lipslay_customer_app/screens/auth/forgot_password_screen.dart';
import 'package:lipslay_customer_app/screens/auth/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

import '../../common/widgets/custom_input_field.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(Assets.iconTransparent), height: 80),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Center(
                child: Text(
                  'Sign In',
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
                    onSaved: (value) => signInController.email.value = value!,
                    validator: (value) =>
                        signInController.validateEmail(value!),
                  ),
                  Obx(
                    () => CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: signInController.obscurePassword.value,
                      onSaved: (value) =>
                          signInController.password.value = value!,
                      validator: (value) =>
                          signInController.validatePassword(value!),
                      suffixIcon: IconButton(
                        icon: Icon(signInController.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          signInController.obscurePassword.value =
                              !signInController.obscurePassword.value;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TButton(text: 'Sign In', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TextButton(
                      onPressed: () {
                        Get.to(()=>ForgotPasswordScreen());
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: TColors.blue),
                      )),
                ],
              ))
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have account?'),
                TextButton(
                  onPressed: () {
                    Get.to(()=>SignUpScreen());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: TColors.blue),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
