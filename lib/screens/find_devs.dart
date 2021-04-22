import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_dev/widgets/find_dev_container.dart';
import 'package:social_dev/db_helper.dart';

class FindDevs extends StatefulWidget {
  @override
  _FindDevsState createState() => _FindDevsState();
}

class _FindDevsState extends State<FindDevs> {
  final DbHelper db = DbHelper();
  final _controller = TextEditingController();
  CollectionReference users = DbHelper().collectionReference;
  List<dynamic> data = [];
  int itemCount = 0;

  void getData(String name) async {
    final result = await db.findDevelopers(name);
    setState(() {
      data = result;
      itemCount = data[0].length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 340,
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(hintText: 'Seach a developer'),
                  onSubmitted: (name) {
                    getData(name);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  _controller.clear();
                  FocusScope.of(context).unfocus();
                  setState(() {
                    data.clear();
                    itemCount = 0;
                  });
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return FindDevContainer(
              devId: data[0][index],
              data: data[1][index],
            );
          },
          itemCount: itemCount),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
