import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    countryCode = CountryCode.fromName('United States');


  }
  bool agreeToTerms = false;
  final countryPicker = const  FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Image(
                image: AssetImage(Assets.iconTransparent),
                height: 100,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItemsSmall),
              GestureDetector(
                onTap: () async {
                  // Show the country code picker when tapped.
                  countryCode = (await countryPicker.showPicker(context: context))!;
                  // Null check
                 if(countryCode!=null) print('COUNTRY  ${countryCode!.dialCode}');
                },
                child: Container(
                  padding: const  EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  margin: const  EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const  BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Text('Show Picker', style: const  TextStyle(color: Colors.white)),
                ),
              ),
              if (countryCode != null)
                Image.asset(
                  countryCode!.flagUri,
                  width: 100.0,
                  fit: BoxFit.cover,
                  package: countryCode!.flagImagePackage,
                ),
              _buildTextField(Icons.person, 'Name'),
              _buildTextField(Icons.email, 'Email'),
              _buildTextField(Icons.lock, 'Password', obscureText: true),
              _buildTextField(Icons.lock, 'Confirm Password',
                  obscureText: true),
              _buildCountryAndPhoneField('Select Country', 'Phone Number'),
              // _buildCountryAndPhoneField('Select Country', 'Whatsapp Number'),
              _buildTextField(Icons.money, 'Enter Affiliate Code (Optional)'),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  Text('I agree to the '),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Text(' and '),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: agreeToTerms ? () {} : null,
                  child: Text('Signup'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Already Have Account?',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: TColors.gray),
          hintText: hintText,
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: TColors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: TColors.gray)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: TColors.black)),
        ),
      ),
    );
  }

  Widget _buildCountryAndPhoneField(String countryHint, String phoneHint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: phoneHint,
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: Icon(Icons.phone, color: TColors.gray),
          prefix: Container(
            color: Colors.red,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: TColors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: TColors.gray)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: TColors.black)),
        ),
      ),
    );
  }
}
