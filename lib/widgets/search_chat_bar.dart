import 'package:flutter/material.dart';
import 'package:social_dev/data_helper.dart';

class SearchChatBar extends StatelessWidget {
  SearchChatBar({this.hintText = 'Search', this.onSubmit});
  
  final dataFuncs = DataFunctions();
  final _controller = TextEditingController();
  final String hintText;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      child: TextField(
        onSubmitted: (user) async {
          onSubmit();
          final users = await dataFuncs.getUsers(user);
          _controller.clear();
          //TODO now implement futureBuilder with this data
          print(users);
        },
        textInputAction: TextInputAction.go,
        controller: _controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black87,
            size: 22,
          ),
          filled: true,
          fillColor: Colors.white70,
          hintText: '$hintText',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
