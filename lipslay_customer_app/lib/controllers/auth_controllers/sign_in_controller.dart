import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var password = ''.obs;
  var obscurePassword = true.obs;



  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Form is valid, proceed with the submission
      Get.snackbar('Success', 'Form is successfully validated');
    }
  }
}
