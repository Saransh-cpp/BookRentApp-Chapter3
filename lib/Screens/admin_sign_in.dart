import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/Screens/admin_page.dart';
import 'package:book_rent_app_chapter3/Screens/login_page.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({Key? key}) : super(key: key);

  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(hintText: 'email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  textAlignVertical: TextAlignVertical.bottom,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordTextController,
                  decoration: const InputDecoration(hintText: 'password'),
                  validator: (val) =>
                      val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                  textAlignVertical: TextAlignVertical.bottom,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      loginAdmin();
                    }
                  },
                  child: const Text('Sign in'),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => LoginPage()));
                  },
                  child: const Text(
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
      for (var element in value.docs) {
        if (element.data()['id'] != _emailTextController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Wrong ID')));
        } else if (element.data()['password'] != _passwordTextController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Wrong password')));
        } else {
          setState(() {
            _emailTextController.text = '';
            _passwordTextController.text = '';
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => const AdminPage()));
        }
      }
    });
  }
}
