// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, avoid_print, dead_code, use_key_in_widget_constructors, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("YES");
    } else {
      print("NO");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10),
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
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Please fill Username";
                          } else if (value!.length < 6) {
                            return "UserName is too short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "UserName",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Email is Invalid!";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value == "") {
                            return "please fill the password";
                          } else if (value!.length < 8) {
                            return "Password is too short!";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "please fill the password";
                          } else if (value!.length < 11) {
                            return "Phone number must be 11";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Phone number",
                          icon: Icon(Icons.phone),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                            child: Text("Register"),
                            color: Colors.blueGrey[400],
                            onPressed: () {
                              validation();
                            }),
                      ),
                      
                      Row(
                        children: [
                          Text("I Have Already An Account!"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
