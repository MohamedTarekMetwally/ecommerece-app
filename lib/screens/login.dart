// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, use_key_in_widget_constructors
import 'package:ecommerece_app/screens/sign_up.dart';
import 'package:ecommerece_app/widgets/changescreen.dart';
import 'package:ecommerece_app/widgets/mytextformfield.dart';
import 'package:ecommerece_app/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';

import '../widgets/MyButton.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("YES");
  } else {
    print("NO");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          MyTextFormField(
            name: 'email',
            validator: () {
              (value) {
                if (value == "") {
                  return "Please Fill Email";
                } else if (!regExp.hasMatch(value!)) {
                  return "Email Is Invalid";
                }
                return "";
              };
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: 'password',
            validator: (value) {
              if (value == "") {
                return "Please fill password";
              } else if (value!.length < 8) {
                return "Password is too short";
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),

          //BUTTON
          MyButton(
              name: 'LOGIN',
              onPressed: () {
                validation();
              }),
          ChangeScreen(
              name: 'SignUp',
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => SignUp(),
                  ),
                );
              },
              whichAccount: 'I have not Account!'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
