import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldMessengerState>();

  //UserServices _userServices = UserServices();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String email = '';
  String password = '';
  String cpassword = '';
  String error = '';
  String name = '';
  bool hidePass1 = true;
  bool hidePass2 = true;
  String userImageUrl = '';

  Widget emailAndNameField(String hint, String error, Icon icon) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      children: [
        Container(
          width: _screenWidth / 1.08,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(0),
          child: TextFormField(
            controller: hint == 'Enter Name'
                ? _nameTextController
                : _emailTextController,
            decoration: InputDecoration(hintText: hint, prefixIcon: icon),
            validator: (val) => val!.isEmpty ? error : null,
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (val) {
              if (hint == "Enter Email") {
                setState(() {
                  email = val;
                });
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget passwordField(String hint, String error) {
    passwordValidator(String cpassword) {
      if (cpassword.length < 6) {
        return error;
      } else if (cpassword != password) {
        return 'Password does not match';
      }
      return null;
    }

    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    if (hint == 'Enter Password') {
      return Column(
        children: [
          Container(
            width: _screenWidth / 1.08,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: const Icon(Icons.vpn_key),
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
              validator: (val) => val!.length < 6 ? error : null,
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: hidePass1,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: _screenWidth / 1.08,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(0),
            child: TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: const Icon(Icons.vpn_key),
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
              validator: (val) => passwordValidator(val!),
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: hidePass2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        backgroundColor: Colors.yellow,
        body: user.status == Status.Authenticating
            ? const Loading()
            : Scaffold(
            key: _key,
            backgroundColor: Colors.pink[50],
            body: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const Text(
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
                            const SizedBox(
                              height: 60,
                            ),
                            emailAndNameField("Enter Name",
                                'Enter a name', const Icon(Icons.person)),
                            emailAndNameField("Enter Email",
                                'Enter an email', const Icon(Icons.email)),
                            passwordField("Enter Password",
                                'Enter a password 6+ chars long'),
                            passwordField("Confirm Password",
                                'Enter a password 6+ chars long'),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!
                                    .validate()) {
                                  if (!await user.signUp(
                                      _nameTextController.text,
                                      _emailTextController.text,
                                      _passwordTextController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Sign up failed")));
                                    return;
                                  }
                                }
                              },
                              child: const Text('Register'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                widget.toggleView();
                              },
                              child: const Text(
                                'I already have an account',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                            ),
                            Text(
                              error,
                              style: const TextStyle(
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map<String, dynamic> data) {
    _firestore.collection(collection).doc(data["userId"]).set(data);
  }
}