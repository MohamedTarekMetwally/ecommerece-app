// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String name;
  MyTextFormField({required this.name, required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator(),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        
      ),
    );
  }
}
