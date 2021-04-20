import 'package:flutter/material.dart';
import 'package:social_dev/screens/view_profile.dart';

class FindDevContainer extends StatelessWidget {
  FindDevContainer({this.devName, this.data, this.foundUserId});

  final String devName;
  final data;
  final foundUserId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewProfile(data: data, foundDevId: foundUserId),
          ),
        );
      },
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.black12,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('images/profile.jpg'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
            SizedBox(width: 10),
            Text(
              '$devName',
              style: TextStyle(fontSize: 18, letterSpacing: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
