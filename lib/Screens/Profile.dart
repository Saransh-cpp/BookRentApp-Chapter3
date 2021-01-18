
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Utility/auth.dart';
import 'package:test_app/main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/provider/user.dart';
import 'package:test_app/services/user.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}



class _UpdateProfileState extends State<UpdateProfile> {


  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  UserServices _userServices = UserServices();

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

    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      body: //user.status == Status.Authenticating ? Loading() :
      isLoading ? Loading() : Scaffold(
              backgroundColor: Colors.pink[50],
              appBar: AppBar(
                title: Text("Profile"),
                backgroundColor: Colors.black,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    ),
                    child: Container(
                      width: _screenWidth,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    initialValue: initname,
                                    onChanged: (text) => {
                                      setState(() {
                                        // print(text);
                                        // text == ''
                                        //     ? name = text
                                        //     : name = user.userModel.name;
                                        namebool = true;
                                        name = text;
                                      })
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person)),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter a name' : null,
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    initialValue: initemail,
                                    decoration: InputDecoration(
                                        hintText: "Enter email",
                                        prefixIcon: Icon(Icons.email)),
                                    onChanged: (val) {
                                      setState(() {
                                        emailbool = true;
                                        email = val;
                                      });
                                    },
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an email' : null,
                                    textAlignVertical: TextAlignVertical.bottom,

                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    initialValue: initaddress,
                                    onChanged: (val){
                                      setState(() {
                                        addressbool = true;
                                        address = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter address",
                                        prefixIcon: Icon(Icons.home_work_rounded)),
                                    validator: (val) =>
                                    val.isEmpty ? 'Enter an address' : null,
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    initialValue: initbio,
                                    onChanged: (val){
                                      setState(() {
                                        biobool = true;
                                        bio = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter bio",
                                        prefixIcon: Icon(Icons.email)),
                                    validator: (val) =>
                                    val.isEmpty ? 'Enter a bio' : null,
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    initialValue: initnumber,
                                    onChanged: (val){
                                      setState(() {
                                        numberbool = true;
                                        number = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter number",
                                        prefixIcon: Icon(Icons.phone)),
                                    validator: (val) =>
                                    val.isEmpty ? 'Enter a number' : null,
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                RaisedButton(
                                  onPressed: () async {

                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      // if (!await _userServices.createUser({
                                      //   'name': namebool ? name : user.userModel.name,
                                      //   'email': emailbool ? email : user.userModel.email,
                                      //   'uid': user.user.uid,
                                      //   'stripeId': '',
                                      //   'number': numberbool ? number : user.userModel.number,
                                      //   'address': addressbool ? address : user.userModel.address,
                                      //   'bio': biobool ? bio : user.userModel.bio
                                      // })) {
                                      if(!await user.updateUser(
                                          namebool ? name : user.userModel.name,
                                        emailbool ? email : user.userModel.email,
                                        numberbool ? number : user.userModel.number,
                                        addressbool ? address : user.userModel.address,
                                          biobool ? bio : user.userModel.bio
                                      //     {'name': namebool ? name : user.userModel.name,
                                      //     'email': emailbool ? email : user.userModel.email,
                                      //     'uid': user.user.uid,
                                      //     'stripeId': '',
                                      //     'number': numberbool ? number : user.userModel.number,
                                      //     'address': addressbool ? address : user.userModel.address,
                                      //     'bio': biobool ? bio : user.userModel.bio
                                      // }
                                      )) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        _key.currentState.showSnackBar(SnackBar(
                                            content: Text("Network Issue, Try again")));
                                      } else {
                                        //await _userServices.getUserById(user.user.uid);
                                        // setState(() {
                                        //   print(user.userModel.address);
                                        //   initemail = user.userModel.email;
                                        //   initnumber = user.userModel.number;
                                        //   initbio = user.userModel.bio;
                                        //   initaddress = user.userModel.address;
                                        //   initname = user.userModel.name;
                                        // });
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pop(context);
                                      }
                                    }
                                  },
                                  child: Text('Register'),
                                ),
                                SizedBox(
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

/*Santos
  Future validateForm() async{
    Register register = Register();
    user = await firebaseAuth.currentUser;
    Map value = {
      "username": user.displayName,
      "email": user.email,
      "userId": user.uid,

    };
    if(user == null){
      await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text).then((u) async => {
            _userService.createUser(user.uid.toString(), value),
      }).catchError((e) {
        print(e.toString());
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
    }
  }*/


//Random video
/*Future _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => _imageFile = tempImg );

  }

  Widget _displayChild1() {
    if (_imageFile == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(Icons.add, color: Colors.grey,),
      );
    } else {
      return Image.file(_imageFile, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Future<void> uploadAndSaveData() async {
    if(_imageFile == null) {
      print('all the images must be provided');
    }
    else {
      if(_formKey.currentState.validate()) {
        if(_passwordTextController.text == _confirmPasswordController.text) {
          await uploadToStorage();
        }
      }
    }
  }

  /*displayDialogue(String error) {
    showDialog(context: context,
        builder: (c) {
          return AlertDialog(
            content: Text(
                error
            ),
          );
        });
  }*/

 // String url;

  uploadToStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
    Reference reference = storage.ref().child(picture);
    await reference.putFile(_imageFile);

    userImageUrl = await reference.getDownloadURL();
    registerUser();

    //FirebaseAuth _auth = FirebaseAuth.instance;
    //void _registerUser() async{
    //User user;
    //}
  }

  FirebaseAuth _auth = FirebaseAuth.instance;


  //registration
  void registerUser() async {
    User firebaseUser;
    await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text
    ).then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      print(error.toString());
    });

    if (firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => NavBar()));
      });
    }
  }

  Future saveUserInfoToFireStore(User user) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "name": _nameTextController.text,
      "url": userImageUrl,
      BookApp.userCartList: ["garbageValue"],
    });

    await BookApp.sharedPreferences.setString(BookApp.userUID, user.uid);
    await BookApp.sharedPreferences.setString(BookApp.userEmail, user.email);
    await BookApp.sharedPreferences.setString(BookApp.userName, _nameTextController.text);
    await BookApp.sharedPreferences.setString(BookApp.userPhotoUrl, userImageUrl);
    await BookApp.sharedPreferences.setStringList(BookApp.userCartList, ["garbageValue"]);
  }*/


// Santos
/*class UserService{
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = 'users';

  createUser(String uid, Map value){
    _database.reference().child("$ref/$uid").set(
        value
    ).catchError((e) {
      print(e.toString());
    });
  }
}*/

//Santos
/*Future validateForm() async {
    FormState formState = _formKey.currentState;
    UserServices _userServices = UserServices();

    if (formState.validate()) {
      User user = await firebaseAuth.currentUser;
      //if (user == null) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
            .then((user) =>
        {
          _userServices.createUser(
              {
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": user.uid,

              }
          )
        }).catchError((err) => {print('error is: ' + err.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      }
    //}
  }*/
}


