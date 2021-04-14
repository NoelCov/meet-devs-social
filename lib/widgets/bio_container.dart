import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BioContainer extends StatelessWidget {
  //TODO Make it so user has to type a name and a bio!

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            'Noel Covarrubias',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Mobile Developer',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle),
              Icon(Icons.clear),
            ],
          )
        ],
      ),
    );
  }
}
