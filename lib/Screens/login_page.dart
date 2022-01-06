import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_rent_app_chapter3/Screens/loading.dart';
import 'package:book_rent_app_chapter3/Screens/register.dart';

import 'package:book_rent_app_chapter3/provider/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldMessengerState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return user.status == Status.Authenticating
          ? const Loading()
          : Scaffold(
              key: _key,
              backgroundColor: Colors.pink[50],
              body: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to\n Chapter 3',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailTextController,
                              decoration: const InputDecoration(hintText: 'email'),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordTextController,
                              decoration: const InputDecoration(hintText: 'password'),
                              validator: (val) => val!.length < 6
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
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (!await user.signIn(
                                      _emailTextController.text,
                                      _passwordTextController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("Sign in failed")));
                                  }
                                }
                              },
                              child: const Text('Sign in'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: const Text(
                                  'I am a new user',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                )),
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
                  )),
    );
  }
}