// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final VoidCallback onTap;
  final String name;
  ChangeScreen(
      {required this.name, required this.onTap, required this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Text(whichAccount),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(name,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
              )),
        ),
      ],
    );
  }
}
