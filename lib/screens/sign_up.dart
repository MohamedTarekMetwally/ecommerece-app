// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, use_key_in_widget_constructors, unnecessary_new

import 'package:ecommerece_app/screens/login.dart';
import 'package:ecommerece_app/widgets/changescreen.dart';
import 'package:ecommerece_app/widgets/mybutton.dart';
import 'package:flutter/material.dart';

import '../widgets/mytextformfield.dart';
import '../widgets/passwordtextformfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool obserText = true;
RegExp regExp = new RegExp(p);

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("YES");
    } else {
      print("NO");
    }
  }

  Widget _buildAllTextFormField() {
    return Column(
      children: <Widget>[
        MyTextFormField(
          name: 'user name',
          validator: () {
            (value) {
              if (value == "") {
                return "Please Fill username";
              } else if (value.length < 6) {
                return "username Is Invalid";
              }
              return "";
            };
          },
        ),
        MyTextFormField(
          name: 'Email',
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
        MyTextFormField(
          name: 'Phone number',
          validator: () {
            (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (value.length < 11) {
                return "Phone number mush be 11";
              }
              return "";
            };
          },
        ),
      ],
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 350,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: 'Register',
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
              name: 'Login',
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => Login(),
                ));
              },
              whichAccount: 'I have account already'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),

                ////*
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
