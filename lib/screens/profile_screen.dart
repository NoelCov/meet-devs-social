import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_dev/widgets/profile_image.dart';
import 'package:social_dev/widgets/bio_container.dart';
import 'package:social_dev/widgets/post_container.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:social_dev/widgets/addPostFAB.dart';
import 'package:social_dev/db_helper.dart';

class ProfileScreen extends StatelessWidget {
  final DbHelper db = DbHelper();

  @override
  Widget build(BuildContext context) {
    String postText;
    Stream documentStream = db.createUsersStream();

    return StreamBuilder<DocumentSnapshot>(
        stream: documentStream,
        builder: (context, documentSnapshot) {
          if (documentSnapshot.hasError) {
            return Text('Something wen\'t wrong');
          }

          if (documentSnapshot.hasData) {
            final data = documentSnapshot.data;
            final posts = data['posts'].reversed;
            List<PostContainer> postContainers = [];

            for (var post in posts) {
              postContainers.add(
                PostContainer(
                  post: post.toString(),
                ),
              );
            }

            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                floatingActionButton: addPostFAB(context, postText),
                appBar: AppBar(
                  toolbarHeight: 40,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit_profile');
                      },
                    )
                  ],
                  automaticallyImplyLeading: false,
                ),
                body: Column(
                  children: [
                    ProfileImage(
                      image: AssetImage('images/profile.jpg'),
                    ),
                    BioContainer(
                      name: '${data['name']}',
                      title: '${data['title']}',
                      bio: '${data['bio']}',
                    ),
                    Divider(
                      thickness: 1,
                      height: 5,
                      color: Colors.black12,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: postContainers,
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavBar(),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        });
  }
}
