import 'package:flutter/material.dart';

const defaultImage = AssetImage('images/final.jpg');

class ProfileImage extends StatelessWidget {
  ProfileImage({
    this.image = defaultImage,
  });

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
