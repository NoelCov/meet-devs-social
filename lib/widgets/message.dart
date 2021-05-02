import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  Message({@required this.messageContent});

  final String messageContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Color(0x9FF4DF6A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            '$messageContent',
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
        ),
      ),
    );
  }
}
