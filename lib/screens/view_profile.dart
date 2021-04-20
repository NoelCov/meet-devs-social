import 'package:flutter/material.dart';
import 'package:social_dev/widgets/profile_image.dart';
import 'package:social_dev/widgets/bio_container.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({this.data, this.foundDevId});

  final data;
  final foundDevId;

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String follow = 'Follow';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImage(
              image: AssetImage('images/profile.jpg'),
            ),
            BioContainer(
              name: '${widget.data['name']}',
              title: '${widget.data['title']}',
              bio: '${widget.data['bio']}',
            ),
            PersonalizedButton(
                buttonText: '$follow',
                onTap: () {
                  setState(() {
                    if (follow == 'Follow') {
                      try {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(_auth.currentUser.uid)
                            .update({
                          'following':
                              FieldValue.arrayUnion([widget.data['email']])
                        });
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.foundDevId)
                            .update({
                          'followers':
                              FieldValue.arrayUnion([_auth.currentUser.email])
                        });
                        follow = 'Following';
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      follow = 'Follow';
                      var val = [];
                      val.add(widget.data['email']);

                      try {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(_auth.currentUser.uid)
                            .update({'following': FieldValue.arrayRemove(val)});

                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.foundDevId)
                            .update({'followers': FieldValue.arrayRemove([_auth.currentUser.email])});

                      } catch (e) {
                        print(e);
                      }
                    }
                  });
                },
                width: 300)
          ],
        ),
      ),
    );
  }
}
