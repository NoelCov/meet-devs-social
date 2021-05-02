import 'package:flutter/material.dart';
import 'package:social_dev/widgets/user_chat_title.dart';
import 'package:social_dev/widgets/message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserChatTitle(userName: 'Noel Covarrubias'),
            SingleChildScrollView(
              child: Column(
                children: [
                  Message(messageContent: 'Hello'),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10),
                  width: 300,
                  child: TextField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: 'Start typing a message',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    message.clear();
                    // TODO change this to send it to DB.
                    print(message.text);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    child: Icon(
                      Icons.send,
                      size: 35,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

