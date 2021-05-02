import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

List addPostToList(value) {
  final List<String> postList = [];
  postList.add(value);
  return postList;
}

FloatingActionButton addPostFAB(BuildContext context, String postText) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {

                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(_auth.currentUser.uid)
                              .update({
                            'posts': FieldValue.arrayUnion(
                                addPostToList(postText))
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6),
                          child: Text(
                            'Post',
                            style: TextStyle(color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: TextField(
                      onChanged: (value) {
                        postText = value;
                      },
                      maxLength: 180,
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                          hintText: 'What\'s going on?',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            );
          });
    },
    child: Icon(Icons.create, size: 25),
  );
}