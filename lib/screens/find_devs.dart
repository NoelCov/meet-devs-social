import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_dev/widgets/find_dev_container.dart';

class FindDevs extends StatefulWidget {
  @override
  _FindDevsState createState() => _FindDevsState();
}

class _FindDevsState extends State<FindDevs> {
  final _controller = TextEditingController();
  List devsFound = [];
  List devsFoundIds = [];

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> getData(name) async {
    final Query query = users.where('name', isEqualTo: '$name');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await query.get();

    final myData = querySnapshot.docs;

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    devsFound.clear();
    setState(() {
      for (var i = 0; i < allData.length; i++) {
        devsFoundIds.add(myData[i].id);
        devsFound.add(allData[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(devsFoundIds);
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
                    devsFound.clear();
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
                devName: devsFound[index]['name'].toString(),
                data: devsFound[index],
                foundUserId: devsFoundIds[index]);
          },
          itemCount: devsFound.length),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
