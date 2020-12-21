import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Register.dart';
import 'package:test_app/database.dart';
import 'package:test_app/Screens/Register.dart';

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
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else {
      return Register(toggleView: toggleView);
    }

  }
}

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({
    this.toggleView
});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

/*  //santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;*/

  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

/*  //santos
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    User user = await firebaseAuth.currentUser;
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    }

    setState(() {
      loading = false;
    });
  }

//  Future handleSignIn() async {
//    setState(() {
//      loading = true;
//    });
//  }*/

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.red[300],
        elevation: 0,
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(
                  Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
              RaisedButton(
                onPressed: () async {
                  /*if (_formKey.currentState.validate()) {

                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not find these credentials';
                        loading = false;
                      });
                    }
                  }*/
                },
                child:  Text(
                  'Sign in'
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                error,
                style:  TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      ),
      )
      ;
  }
}







