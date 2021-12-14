// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:ecommerece_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';

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
              Container(
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
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "Please Fill Email";
                        } else if (!regExp.hasMatch(value!)) {
                          return "Email Is Invalid";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "Please fill password";
                        } else if (value!.length < 8) {
                          return "Password is too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obserText = !obserText;
                            });
                          },
                          child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    //*BUTTON
                    // MyButton(name: 'LOGIN', 
                    // onPressed: (){
                    //   validation();
                    // }
                    // ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Text("I Have Not Account"),
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
                          child: Text("SignUp",
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
