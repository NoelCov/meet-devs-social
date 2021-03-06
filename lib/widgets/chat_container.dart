import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  ChatContainer({this.text = '', @required this.senderName});

  final String text;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chat_screen');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/profile.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$senderName',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: text.isNotEmpty ? Text(
                      '$text',
                      maxLines: 2,
                    ) : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}