import 'package:flutter/material.dart';
import 'package:social_dev/widgets/profile_image.dart';
import 'package:social_dev/widgets/bio_container.dart';
import 'package:social_dev/widgets/post_container.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO Create a new post
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.create, size: 25),
      ),
      body: Column(
        children: [
          ProfileImage(),
          BioContainer(),
          Expanded(
            child: ListView(
              children: [
                PostContainer(),
                PostContainer(),
                PostContainer(),
                PostContainer(),
                PostContainer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}



