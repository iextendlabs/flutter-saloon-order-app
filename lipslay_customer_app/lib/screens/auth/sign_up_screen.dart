import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lipslay_customer_app/common/widgets/button.dart';
import 'package:lipslay_customer_app/screens/auth/sign_in_screen.dart';

import '../../common/widgets/country_code_selector.dart';
import '../../common/widgets/custom_input_field.dart';
import '../../controllers/auth_controllers/sign_up_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(Assets.iconTransparent), height: 80),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeXlg,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItemsSmall),
              Form(
                key: signUpController.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.name,
                      onSaved: (value) => signUpController.name.value = value!,
                      validator: (value) => signUpController.validateName(value!),
                    ),
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => signUpController.email.value = value!,
                      validator: (value) =>
                          signUpController.validateEmail(value!),
                    ),
                    Obx(
                      () => CustomTextField(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: signUpController.obscurePassword.value,
                        onSaved: (value) =>
                            signUpController.password.value = value!,
                        validator: (value) =>
                            signUpController.validatePassword(value!),
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.obscurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            signUpController.obscurePassword.value =
                                !signUpController.obscurePassword.value;
                          },
                        ),
                      ),
                    ),
                    CustomTextField(
                      labelText: 'Phone Number',
                      hintText: 'Enter phone number',
                      keyboardType: TextInputType.phone,
                      onSaved: (value) =>
                          signUpController.phoneNumber.value = value!,
                      validator: (value) =>
                          signUpController.validateNumber(value!),
                      prefixIcon: CountryCodeSelector(
                          formController: signUpController,
                          countryCode: signUpController.countryCodePhone),
                    ),
                    CustomTextField(
                      labelText: 'Whatsapp Number',
                      hintText: 'Enter whatsapp number',
                      keyboardType: TextInputType.phone,
                      onSaved: (value) =>
                          signUpController.whatsappNumber.value = value!,
                      validator: (value) =>
                          signUpController.validateNumber(value!),
                      prefixIcon: CountryCodeSelector(
                        formController: signUpController,
                        countryCode: signUpController.countryCodeWhatsapp,
                        icon: Icons.message_outlined,
                      ),
                    ),
                    CustomTextField(
                      labelText: 'Affiliate Code (Optional)',
                      hintText: 'Enter Affiliate Code (Optional)',
                      prefixIcon: const Icon(Icons.money),
                      onSaved: (value) => signUpController.name.value = value!,
                      validator: (value) => signUpController.validateName(value!),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Obx(
                          () => Checkbox(
                            value: signUpController.agreeToTerms.value,
                            onChanged: (bool? value) {
                              signUpController.agreeToTerms.value =
                                  !signUpController.agreeToTerms.value;
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('I agree to '),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'Terms and Conditions',
                                    style: TextStyle(
                                      color: TColors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(' and '),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      color: TColors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),


                      ],
                    ),
                    const SizedBox(height: 10),
                    TButton(text: 'Sign Up', onPressed: () {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have account?'),
                        TextButton(
                          onPressed: () {
                            Get.to(()=>SignInScreen());
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: TColors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
