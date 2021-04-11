import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/login.png', scale: 2.5),
          SizedBox(height: 10),
          Text(
            'SIGN IN!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          PersonalizedInputField(
              hintText: 'Enter email',
              keyboardtype: TextInputType.emailAddress),
          SizedBox(height: 15),
          PersonalizedInputField(
              hideText: true, hintText: 'Enter your password'),
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: PersonalizedButton(
                  buttonText: 'Log in', onTap: () {}, width: 290))
        ],
      ),
    );
  }
}
