import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.white70,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page_sharp),
          label: 'Find Devs',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
