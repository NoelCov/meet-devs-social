import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            Image.asset('images/register.png', scale: 2.5),
            SizedBox(height: 10),
            Text(
              'SIGN UP!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            PersonalizedInputField(
                onChange: (value) {
                  email = value;
                },
                keyboardtype: TextInputType.emailAddress,
                hideText: false,
                hintText: 'Enter your email'),
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
                  width: 290,
                  buttonText: 'Create account',
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });

                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);

                      if (user != null) {
                        print('Success!');
                        //TODO Push to next screen!
                      }
                    } catch (e) {
                      print(e);
                    }

                    setState(() {
                      loading = false;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
