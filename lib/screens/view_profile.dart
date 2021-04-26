import 'package:flutter/material.dart';
import 'package:social_dev/widgets/profile_image.dart';
import 'package:social_dev/widgets/bio_container.dart';
import 'package:social_dev/widgets/personalized_button.dart';
import 'package:social_dev/db_helper.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({this.data, this.foundDevId});
  final data;
  final foundDevId;

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String follow;
  final DbHelper db = DbHelper();

  void setFollow() async {
    final response = await db.checkFollowing(widget.data['email']);
    setState(() {
      follow = response ? 'Following' : 'Follow';
    });
  }

  @override
  Widget build(BuildContext context) {
    setFollow();
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
                      db.followUser(widget.foundDevId, widget.data['email']);
                      follow = 'Following';
                    } else {
                      db.unfollowUser(widget.foundDevId, widget.data['email']);
                      follow = 'Follow';
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
