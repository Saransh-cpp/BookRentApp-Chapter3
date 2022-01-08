import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/loading.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:book_rent_app_chapter3/provider/user.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldMessengerState>();

  String email = '';
  String name = '';
  String address = '';
  String bio = '';
  String number = '';

  bool emailbool = false;
  bool namebool = false;
  bool addressbool = false;
  bool biobool = false;
  bool numberbool = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);

    String initemail = user.userModel.email;
    String initname = user.userModel.name;
    String initaddress = user.userModel.address;
    String initbio = user.userModel.bio;
    String initnumber = user.userModel.number;
    bool isLoading = false;

    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      key: _key,
      body: isLoading
      // ignore: dead_code
          ? const Loading()
          : Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50,
              ),
              child: SizedBox(
                width: _screenWidth,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: _screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            child: TextFormField(
                              initialValue: initname,
                              onChanged: (text) =>
                              {
                                setState(() {
                                  namebool = true;
                                  name = text;
                                })
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person)),
                              validator: (val) =>
                              val!.isEmpty ? 'Enter a name' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: _screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            child: TextFormField(
                              initialValue: initemail,
                              decoration: const InputDecoration(
                                  hintText: "Enter email",
                                  prefixIcon: Icon(Icons.email)),
                              onChanged: (val) {
                                setState(() {
                                  emailbool = true;
                                  email = val;
                                });
                              },
                              validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: _screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            child: TextFormField(
                              initialValue: initaddress,
                              onChanged: (val) {
                                setState(() {
                                  addressbool = true;
                                  address = val;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter address",
                                  prefixIcon:
                                  Icon(Icons.home_work_rounded)),
                              validator: (val) =>
                              val!.isEmpty ? 'Enter an address' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: _screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            child: TextFormField(
                              initialValue: initbio,
                              onChanged: (val) {
                                setState(() {
                                  biobool = true;
                                  bio = val;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter bio",
                                  prefixIcon: Icon(Icons.email)),
                              validator: (val) =>
                              val!.isEmpty ? 'Enter a bio' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: _screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: initnumber,
                              onChanged: (val) {
                                setState(() {
                                  numberbool = true;
                                  number = val;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter number",
                                  prefixIcon: Icon(Icons.phone)),
                              validator: (val) =>
                              val!.isEmpty ? 'Enter a number' : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                if (!await user.updateUser(
                                    namebool ? name : user.userModel.name,
                                    emailbool
                                        ? email
                                        : user.userModel.email,
                                    numberbool
                                        ? number
                                        : user.userModel.number,
                                    addressbool
                                        ? address
                                        : user.userModel.address,
                                    biobool ? bio : user.userModel.bio)) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  _key.currentState!.showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Network Issue, Try again")));
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: const Text('Register'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
