import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';
import 'package:social_dev/widgets/personalized_button.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/register.png', scale: 2.5),
          SizedBox(height: 10),
          Text(
            'SIGN UP!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          PersonalizedInputField(
              keyboardtype: TextInputType.emailAddress,
              hideText: false,
              hintText: 'Enter your email'),
          SizedBox(height: 15),
          PersonalizedInputField(
              hideText: true, hintText: 'Enter your password'),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: PersonalizedButton(
                width: 290, buttonText: 'Create account', onTap: () {}),
          )
        ],
      ),
    );
  }
}
