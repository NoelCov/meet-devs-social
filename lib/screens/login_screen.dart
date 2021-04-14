import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Column(
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
                onChange: (value) {
                  email = value;
                },
                hintText: 'Enter email',
                keyboardtype: TextInputType.emailAddress),
            SizedBox(height: 15),
            PersonalizedInputField(
                onChange: (value) {
                  password = value;
                },
                hideText: true,
                hintText: 'Enter your password'),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: PersonalizedButton(
                    buttonText: 'Log in',
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });

                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          print('Logged in!');
                          Navigator.pushNamed(context, '/profile');
                        }
                      } catch (e) {
                        print(e);
                      }

                      setState(() {
                        loading = false;
                      });
                    },
                    width: 290))
          ],
        ),
      ),
    );
  }
}
