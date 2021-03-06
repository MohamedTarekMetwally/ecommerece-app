import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final VoidCallback onTap;
  PasswordTextFormField(
      {required this.onTap,
      required this.name,
      required this.obserText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator(),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
              obserText == true ? Icons.visibility : Icons.visibility_off,
              color: Colors.black),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
