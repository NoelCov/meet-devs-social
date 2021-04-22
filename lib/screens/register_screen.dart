import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_dev/db_helper.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final DbHelper db = DbHelper();
  String email;
  String password;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Center(
          child: SingleChildScrollView(
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
                PersonalizedButton(
                    width: 295,
                    buttonText: 'Create account',
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });

                      final user = await db.registerUser(email, password);

                      if (user != null) {
                        Navigator.pushNamed(context, '/profile');
                      }

                      setState(() {
                        loading = false;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

