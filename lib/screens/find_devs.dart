import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_dev/widgets/bottom_navbar.dart';
import 'package:social_dev/widgets/find_dev_container.dart';
import 'package:social_dev/data_helper.dart';

class FindDevs extends StatefulWidget {
  @override
  _FindDevsState createState() => _FindDevsState();
}

class _FindDevsState extends State<FindDevs> {
  final _controller = TextEditingController();
  final dataFuncs = DataFunctions();
  int itemCount = 0;
  List<dynamic> usersFound = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    onSubmitted: (name) async {
                        _controller.clear();
                        final result = await dataFuncs.getUsers(name);
                        setState(() {
                          usersFound = result;
                          itemCount = usersFound[0].length;
                        });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.clear();
                    FocusScope.of(context).unfocus();
                    setState(() {
                      usersFound.clear();
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
                devId: usersFound[0][index],
                data: usersFound[1][index],
              );
            },
            itemCount: itemCount),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
