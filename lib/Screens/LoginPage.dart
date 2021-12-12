import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:test_app/Screens/AdminSignIn.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Register.dart';
//import 'package:test_app/database.dart';
//import 'package:test_app/Screens/Register.dart';
import 'package:test_app/provider/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldMessengerState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              backgroundColor: Colors.pink[50],
              body: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to\n Chapter 3',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(hintText: 'email'),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(hintText: 'password'),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              textAlignVertical: TextAlignVertical.bottom,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  if (!await user.signIn(
                                      _emailTextController.text,
                                      _passwordTextController.text)) {
                                    _key.currentState.showSnackBar(SnackBar(
                                        content: Text("Sign in failed")));
                                  } else {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => NavBar()));
                                  }
                                }
                              },
                              child: Text('Sign in'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: Text(
                                  'I am a new user',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                )),
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
                  ))),
    );
  }
}
