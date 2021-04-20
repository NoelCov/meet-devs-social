import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BioContainer extends StatelessWidget {
  BioContainer({this.name = 'Your Name', this.title = 'Your title', this.bio = 'Your bio'});

  final String name;
  final String title;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(
            '$name',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              '$bio',
              style: TextStyle(
                fontSize: 12
              ),
              textAlign: TextAlign.center,
            ),
          )
          //TODO Maybe add this back
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.circle, size: 15),
          //     Icon(Icons.clear, size: 15),
          //   ],
          // )
        ],
      ),
    );
  }
}
