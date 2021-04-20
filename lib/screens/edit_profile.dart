import 'package:flutter/material.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:social_dev/widgets/personalized_input_field.dart';
import 'package:social_dev/widgets/profile_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  String newName;
  String newTitle;
  String newBio;

  String currentName;
  String currentTitle;
  String currentBio;

  Future<void> getCurrentData() async {
    final data = await users.doc(_auth.currentUser.uid).get();
    currentName = data['name'];
    currentTitle = data['title'];
    currentBio = data['bio'];
  }

  Future<void> updateUser(String name, String title, String bio) {
    if (name == null) {
      name = currentName;
    }

    if (title == null) {
      title = currentTitle;
    }

    if (bio == null) {
      bio = currentBio;
    }

    return users
        .doc(_auth.currentUser.uid)
        .update({
          'name': name,
          'title': title,
          'bio': bio,
        })
        .then((value) => print('User Updated'))
        .catchError((error) => print('Failed to update user: $error'));
  }

  @override
  void initState() {
    super.initState();
    getCurrentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Edit your profile',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Stack(
                children: [
                  ProfileImage(),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Colors.redAccent,
                          )),
                      child: Icon(
                        Icons.switch_account,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              PersonalizedInputField(
                onChange: (value) {
                  newName = value;
                },
                hintText: 'Your name',
              ),
              SizedBox(height: 10),
              PersonalizedInputField(
                onChange: (value) {
                  newTitle = value;
                },
                hintText: 'Your title',
              ),
              SizedBox(height: 10),
              PersonalizedInputField(
                onChange: (value) {
                  newBio = value;
                },
                hintText: 'Your bio',
              ),
              SizedBox(height: 10),
              PersonalizedButton(
                  buttonText: 'Save',
                  onTap: () {
                    updateUser(newName, newTitle, newBio);
                    Navigator.pop(context);
                  },
                  width: 295)
            ],
          ),
        ),
      ),
    );
  }
}
