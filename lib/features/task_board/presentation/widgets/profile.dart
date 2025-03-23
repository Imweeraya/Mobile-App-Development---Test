import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.firstLetter, this.size, this.fontSize});
  final String firstLetter;
  final double? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: size ?? 32,
      backgroundColor: Colors.amber,
      child: Text(
        firstLetter,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 24,
        ),
      ),
    );

  }
}
