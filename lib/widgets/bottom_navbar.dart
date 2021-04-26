import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.white70,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/profile');
        }
        if (index == 1) {
          Navigator.pushNamed(context, '/find_devs');
        }
        if (index == 2) {
          Navigator.pushNamed(context, '/messages_screen');
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page_sharp),
          label: 'Find Devs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: 'Chat',
        ),
      ],
    );
  }
}
