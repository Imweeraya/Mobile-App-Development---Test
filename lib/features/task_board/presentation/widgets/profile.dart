import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.firstLetter});
  final String firstLetter;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 25,
      backgroundColor: Colors.amber,
      child: Text(
        firstLetter,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );

  }
}
