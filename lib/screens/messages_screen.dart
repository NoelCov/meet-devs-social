import 'package:flutter/material.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:social_dev/widgets/chat_container.dart';
import 'package:social_dev/widgets/search_chat_bar.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Icon(Icons.chat_outlined),
              ],
            ),
          ),
          SearchChatBar(),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
            child: Text('Chats'),
          ),
          Expanded(
            child: ListView(
              children: [
                ChatContainer(
                  text: 'Hello',
                  senderName: 'Noel Covarrubias',
                ),
                ChatContainer(
                  text: 'Hello',
                  senderName: 'Noel Covarrubias',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

