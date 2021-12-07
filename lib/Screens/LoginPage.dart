import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/Screens/AdminSignIn.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Register.dart';
import 'package:test_app/Screens/Register.dart';
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
/*  //santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;*/

  //final AuthService _auth = AuthService();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
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
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              backgroundColor: Colors.pink[50],
              appBar: AppBar(
                title: Text("Sign In"),
                backgroundColor: Colors.pink[400],
                elevation: 0,),

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
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              if (!await user.signIn(_emailTextController.text,
                                  _passwordTextController.text)) {
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Sign in failed")));
                              }
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (c) => NavBar()));

                              /*setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not find these credentials';
                        loading = false;
                      });
                    }*/
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
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            )),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }

  /*FirebaseAuth _auth = FirebaseAuth.instance;

  void loginUser() async{
    User user;
    await _auth.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text
    ).then((authUser){
      user = authUser.user;
    }).catchError((error){
      print(error.toString());
    });
    if(user != null)
      {
        await readData(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => NavBar()));
      }
  }

  Future readData(User user) async{
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value) async {
      await BookApp.sharedPreferences.setString(BookApp.userUID, value.data()[BookApp.userUID]);
      await BookApp.sharedPreferences.setString(BookApp.userEmail, value.data()[BookApp.userEmail]);
      await BookApp.sharedPreferences.setString(BookApp.userName, value.data()[BookApp.userName]);
      await BookApp.sharedPreferences.setString(BookApp.userPhotoUrl, value.data()[BookApp.userPhotoUrl]);

      List<String> cartList = value.data()[BookApp.userCartList].cast<String>();
      await BookApp.sharedPreferences.setStringList(BookApp.userCartList, cartList);
    });
  }*/
}
