import 'package:flutter/material.dart';

class SearchChatBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      child: TextField(
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
          hintText: 'Search',
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
