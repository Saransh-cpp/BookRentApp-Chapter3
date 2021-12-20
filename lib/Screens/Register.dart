import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/Screens/NavBar.dart';
//import 'package:test_app/Utility/auth.dart';
//import 'package:test_app/main.dart';
//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:test_app/Screens/LoginPage.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/provider/user.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldMessengerState>();
  //UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String email = '';
  String password = '';
  String cpassword = '';
  String error = '';
  String name = '';
  bool hidePass1 = true;
  bool hidePass2 = true;
  String userImageUrl = '';

  Widget emailAndNameField(String hint, String error, Icon icon) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: _screenWidth / 1.08,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(0),
          child: TextFormField(
            controller: '$hint' == 'Enter Name'
                ? _nameTextController
                : _emailTextController,
            decoration: InputDecoration(hintText: "$hint", prefixIcon: icon),
            validator: (val) => val.isEmpty ? '$error' : null,
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (val) {
              if ("$hint" == "Enter Email") {
                setState(() {
                  email = val;
                });
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget passwordField(String hint, String error) {
    passwordValidator(String cpassword) {
      if (cpassword.length < 6) {
        return '$error';
      } else if (cpassword != password) {
        return 'Password does not match';
      }
      return null;
    }

    double _screenWidth = MediaQuery.of(context).size.width;
    if ('$hint' == 'Enter Password') {
      return Column(
        children: [
          Container(
            width: _screenWidth / 1.08,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(0),
            child: Container(
              child: TextFormField(
                controller: _passwordTextController,
                decoration: InputDecoration(
                  hintText: "$hint",
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                      icon: Icon(
                        hidePass1 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePass1 = !hidePass1;
                        });
                      }),
                ),
                validator: (val) => val.length < 6 ? '$error' : null,
                textAlignVertical: TextAlignVertical.bottom,
                obscureText: hidePass1,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: _screenWidth / 1.08,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(0),
            child: Container(
              child: TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: "$hint",
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                      icon: Icon(
                        hidePass2 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePass2 = !hidePass2;
                        });
                      }),
                ),
                validator: (val) => passwordValidator(val),
                textAlignVertical: TextAlignVertical.bottom,
                obscureText: hidePass2,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        backgroundColor: Colors.yellow,
        key: _key,
        body: user.status == Status.Authenticating
            ? Loading()
            : Scaffold(
                backgroundColor: Colors.pink[50],
                body: Center(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Welcome to\n Chapter 3',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                emailAndNameField("Enter Name",
                                    'Enter a name', Icon(Icons.person)),
                                emailAndNameField("Enter Email",
                                    'Enter an email', Icon(Icons.email)),
                                passwordField("Enter Password",
                                    'Enter a password 6+ chars long'),
                                passwordField("Confirm Password",
                                    'Enter a password 6+ chars long'),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState
                                        .validate()) {
                                      if (!await user.signUp(
                                          _nameTextController.text,
                                          _emailTextController.text,
                                          _passwordTextController.text)) {
                                        _key.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Sign up failed")));
                                        return;
                                      }
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => NavBar()));
                                    }
                                  },
                                  child: Text('Register'),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    'I already have an account',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).doc(data["userId"]).set(data);
  }
}
