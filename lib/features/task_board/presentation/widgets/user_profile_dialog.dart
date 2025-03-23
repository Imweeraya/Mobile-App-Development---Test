import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_test/features/task_board/presentation/widgets/profile.dart';

import '../../../login/domain/entities/user.dart';

class UserProfileDialog extends StatelessWidget {
  final User user;
  final VoidCallback onLogout;

  const UserProfileDialog({
    super.key,
    required this.user,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Profile(firstLetter: user.firstName[0]),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text('First name:', style: TextStyle(color: Colors.grey),),
                const SizedBox(width: 8,),
                Text(user.firstName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text('Last name:', style: TextStyle(color: Colors.grey),),
                const SizedBox(width: 8,),
                Text(user.lastName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email:', style: TextStyle(color: Colors.grey),),
                const SizedBox(width: 8,),
                Flexible(child: Text(user.email)),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onLogout();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout_rounded, color: Colors.orange,),
              const SizedBox(width: 16,),
              Text('Logout', style: TextStyle(color: Colors.orange),),
            ],
          ),
        ),
      ],
    );
  }
}
