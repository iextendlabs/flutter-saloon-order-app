import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;

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
              Image(image: AssetImage(Assets.icon),height: 150,),
              Center(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildTextField(Icons.person, 'Enter Name'),
              _buildTextField(Icons.email, 'Enter Email'),
              _buildTextField(Icons.lock, 'Enter Password', obscureText: true),
              _buildTextField(Icons.lock, 'Enter Confirm Password', obscureText: true),
              _buildCountryAndPhoneField('Select Country', 'Enter Phone Number'),
              _buildCountryAndPhoneField('Select Country', 'Enter Whatsapp Number'),
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
              ],),
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

  Widget _buildTextField(IconData icon, String hintText, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black54),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryAndPhoneField(String countryHint, String phoneHint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                hintText: countryHint,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                hintText: phoneHint,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
