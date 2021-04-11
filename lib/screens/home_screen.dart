import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Social Devs! </>',
            style: TextStyle(
                fontSize: 40, letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 35),
          Image.asset(
            'images/logo1.png',
            scale: 2.5,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PersonalizedButton(
                  width: 140,
                  buttonText: 'Register',
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  }),
              PersonalizedButton(
                width: 140,
                buttonText: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
