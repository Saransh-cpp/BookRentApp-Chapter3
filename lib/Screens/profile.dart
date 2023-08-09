// ignore_for_file: prefer_const_constructors

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

  String name = '';
  String address = '';
  String bio = '';
  String number = '';

  bool namebool = false;
  bool addressbool = false;
  bool biobool = false;
  bool numberbool = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);

    String initname = user.userModel.name;
    String initaddress = user.userModel.address;
    String initbio = user.userModel.bio;
    String initnumber = user.userModel.number;
    bool isLoading = false;

    double _screenWidth = MediaQuery.of(context).size.width;
    const Color _iconColor = Colors.pink;

    return Scaffold(
      key: _key,
      body: isLoading
          // ignore: dead_code
          ? const Loading()
          : Stack(
              children: [
                Opacity(
                  opacity: .8,
                  child: Image.asset(
                    "images/profile_background.jpeg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                    elevation: 3,
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: _screenWidth,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 140,
                                  child: Image.asset(
                                    "images/reader.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                ListTile(
                                  horizontalTitleGap: 8.0,
                                  tileColor: Colors.white,
                                  leading: Icon(
                                    Icons.person,
                                    color: _iconColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  title: TextFormField(
                                    initialValue: initname,
                                    onChanged: (text) => {
                                      setState(() {
                                        namebool = true;
                                        name = text;
                                      })
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter a name' : null,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  horizontalTitleGap: 8.0,
                                  tileColor: Colors.white,
                                  leading: Icon(
                                    Icons.home_work_rounded,
                                    color: _iconColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  title: TextFormField(
                                    initialValue: initaddress,
                                    onChanged: (val) {
                                      setState(() {
                                        addressbool = true;
                                        address = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter address",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter an address'
                                        : null,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  horizontalTitleGap: 8.0,
                                  tileColor: Colors.white,
                                  leading: Icon(
                                    Icons.chat,
                                    color: _iconColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  title: TextFormField(
                                    initialValue: initbio,
                                    onChanged: (val) {
                                      setState(() {
                                        biobool = true;
                                        bio = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter bio",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter a bio' : null,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  horizontalTitleGap: 8.0,
                                  tileColor: Colors.white,
                                  leading: Icon(
                                    Icons.phone,
                                    color: _iconColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  title: TextFormField(
                                    keyboardType: TextInputType.number,
                                    initialValue: initnumber,
                                    onChanged: (val) {
                                      setState(() {
                                        numberbool = true;
                                        number = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter number",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter a number' : null,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: Size(double.maxFinite, 50),
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 174, 9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      if (!await user.updateUser(
                                          namebool ? name : user.userModel.name,
                                          user.userModel.email,
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
                                        _key.currentState!.showSnackBar(SnackBar(
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
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
