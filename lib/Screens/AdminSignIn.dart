import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Screens/AdminPage.dart';
import 'package:test_app/Screens/LoginPage.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  textAlignVertical: TextAlignVertical.bottom,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(hintText: 'password'),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  textAlignVertical: TextAlignVertical.bottom,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      loginAdmin();
                    }
                  },
                  child: Text('Sign in'),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => LoginPage()));
                  },
                  child: Text(
                    'I am a user',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection('admins').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['id'] != _emailTextController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Wrong ID')));
        } else if (element.data()['password'] != _passwordTextController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Wrong password')));
        } else {
          setState(() {
            _emailTextController.text = '';
            _passwordTextController.text = '';
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => AdminPage()));
        }
      });
    });
  }
}
