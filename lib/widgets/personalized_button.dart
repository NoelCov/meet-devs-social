import 'package:flutter/material.dart';

class PersonalizedButton extends StatelessWidget {
  PersonalizedButton({@required this.buttonText, @required this.onTap, @required this.width});

  final String buttonText;
  final Function onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Text(
          '$buttonText',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}