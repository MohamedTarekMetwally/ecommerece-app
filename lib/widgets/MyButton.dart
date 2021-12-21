import 'package:flutter/material.dart';
import 'package:ecommerece_app/screens/sign_up.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;

  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        child: Text(name),
        color: Colors.lightBlue,
        onPressed: onPressed,
      ),
    );
  }
}
