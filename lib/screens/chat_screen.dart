import 'package:flutter/material.dart';
import 'package:social_dev/widgets/user_chat_title.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserChatTitle(userName: 'Noel Covarrubias'),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0x9FF4DF6A),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Text('Hello'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
