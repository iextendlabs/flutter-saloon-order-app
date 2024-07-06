import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var obscurePassword = true.obs;
  var phoneNumber = ''.obs;
  var whatsappNumber = ''.obs;
  var agreeToTerms = false.obs;
  final countryPicker = const FlCountryCodePicker();
  var countryCodePhone = Rxn<CountryCode>();
  var countryCodeWhatsapp = Rxn<CountryCode>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    countryCodePhone.value = CountryCode.fromCode('AE');
    countryCodeWhatsapp.value = CountryCode.fromCode('AE');
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

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

  String? validateNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter your number';
    } else if (value.length < 6) {
      return 'Enter complete number';
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

  void pickCountryCode(BuildContext context, Rxn<CountryCode>  countryCode) async {
    final pickedCode = await countryPicker.showPicker(context: context);
    if (pickedCode != null) {
      countryCode.value = pickedCode;
    }
  }

  void pickCountryCodeWhatsapp(BuildContext context) async {
    final pickedCode = await countryPicker.showPicker(context: context);
    if (pickedCode != null) {
      countryCodeWhatsapp.value = pickedCode;
    }
  }
}
