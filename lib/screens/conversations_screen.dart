import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:social_dev/widgets/chat_container.dart';
import 'package:social_dev/widgets/search_chat_bar.dart';
import 'package:social_dev/db_helper.dart';

class ConversationsScreen extends StatefulWidget {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  final CollectionReference users = DbHelper().collectionReference;
  final DbHelper db = DbHelper();
  List<dynamic> usersFound = [];
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SafeArea(
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                SizedBox(height: 100),
                                SearchChatBar(
                                  hintText: 'Find a developer to chat with',
                                ),
                                SizedBox(height: 20),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ChatContainer(
                                          senderName: 'Noel',
                                        ),
                                      );
                                    },
                                    itemCount: 2),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.create,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SearchChatBar(),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20, bottom: 20),
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
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
