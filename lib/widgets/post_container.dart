import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  //TODO Modify the container and make it so that it takes the text parameter
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 0.8, color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Today I worked on my app if anyone wants to help me that\'d be nice',
          style: TextStyle(
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}