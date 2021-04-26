import 'package:flutter/material.dart';

class UserChatTitle extends StatelessWidget {
  UserChatTitle({@required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/profile.jpg'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Text(
            '$userName',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
