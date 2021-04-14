import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  //TODO Modify widget to have default image. Unless users adds image

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 80, right: 80, top: 60, bottom: 20),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/profile.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}