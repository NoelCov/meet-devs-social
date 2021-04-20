import 'package:flutter/material.dart';

class PersonalizedInputField extends StatelessWidget {
  PersonalizedInputField({this.hideText = false, this.hintText, this.keyboardtype, @required this.onChange});

  final bool hideText;
  final String hintText;
  final TextInputType keyboardtype;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        onChanged: onChange,
        keyboardType: keyboardtype,
        obscureText: hideText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}