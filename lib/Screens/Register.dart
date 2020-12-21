
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
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

class Register extends StatefulWidget {

  final Function toggleView;
  Register({
    this.toggleView
  });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //final AuthService _auth = AuthService();


  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  String email = '';
  String password = '';
  String error = '';
  String name = '';
  bool hidePass = true;
  String userImageUrl = '';
  File _imageFile;


  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.black,
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
                'SignIn',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          )
        ],
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
                  // random youtube
                  /*InkWell(
                    onTap: () async {
                      final tmpFile = await _selectAndPickImage();

                      setState(() {
                        _imageFile = tmpFile;
                      });
                    },

                    child: CircleAvatar(
                      radius: _screenWidth * 0.18,
                      backgroundImage: _imageFile == null ? null : FileImage(
                          File(_imageFile.path)),
                      child: _imageFile == null
                          ? Icon(
                          Icons.add_photo_alternate, size: _screenWidth * 0.18)
                          : null,
                    ),
                  ),*/
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
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(0),
                          child: TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                                hintText: "Enter Name",
                                prefixIcon: Icon(Icons.person)
                            ),
                            validator: (val) =>
                            val.isEmpty
                                ? 'Enter a name'
                                : null,
                            textAlignVertical: TextAlignVertical.bottom,
                            // net ninja
                            /*onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },*/
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: _screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                                hintText: "Enter email",
                                prefixIcon: Icon(Icons.email)
                            ),
                            validator: (val) =>
                            val.isEmpty
                                ? 'Enter an email'
                                : null,
                            textAlignVertical: TextAlignVertical.bottom,
                            // net ninja
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: TextFormField(
                            controller: _passwordTextController,
                            validator: (val) =>
                            val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            textAlignVertical: TextAlignVertical.bottom,
                            obscureText: hidePass,
                            // net ninja
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = !hidePass;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _confirmPasswordController,
                          validator: (val) =>
                          val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          textAlignVertical: TextAlignVertical.bottom,
                          obscureText: true,
                          //onChanged: (val) {
                          //setState(() {
                          //password = val;
                          //});
                          //},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            // net ninja
                            //if (_formKey.currentState.validate()) {

                            // Santos
                            //await validateForm();

                            /*Random video
                            uploadAndSaveData();*/

                            /* net ninja
                              dynamic result = await registerWithEmailAndPassword(
                                  email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'please suppy a valid email';
                                });
                              }*/
                          },


                          child: Text(
                              'Register'
                          ),
                        ),

                        RaisedButton(
                          onPressed: () async {
                            Auth auth = Auth();
                            User user = await auth.googleSignIn();
                            if (user == null) {
                              _userServices.createUser({
                                "name": user.displayName,
                                "photo": user.photoUrl,
                                "email": user.email,
                                "userId": user.uid
                              });
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
                            }
                          },
                          child: Text(
                              'Google SignIn'
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
              ),
            )
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
  /*Future _selectAndPickImage() async {
    PickedFile firstImage = await ImagePicker().getImage(source: ImageSource.gallery);
    return firstImage;
  }

  Future<void> uploadAndSaveData() async {
    /*if(_imageFile == null){
      showDialog(
          context: context,
      builder: (c){
            return AlertDialog(
              content: Text(
                'Please select an image'
              ),
            );

      });
    }
    else*/
    _passwordTextController.text == _confirmPasswordController.text
        ? _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _nameTextController.text.isNotEmpty

        //? uploadToStorage()

        //: displayDialogue('Please fill up the form')

        : displayDialogue('Passwords do not match');
    _registerUser();

  }

  displayDialogue(String error) {
    showDialog(context: context,
        builder: (c) {
          return AlertDialog(
            content: Text(
                error
            ),
          );
        });
  }

  String url;

  uploadToStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref().child("imageFileName" + DateTime
        .now()
        .millisecondsSinceEpoch
        .toString());
    UploadTask storageUploadTask = storageReference.putFile(_imageFile);
    storageUploadTask.whenComplete(() {
      url = storageReference.getDownloadURL() as String;
    }).catchError((onError) {
      print(onError);
    });
    _registerUser();

    //FirebaseAuth _auth = FirebaseAuth.instance;
    //void _registerUser() async{
    //User user;
    //}
  }

  FirebaseAuth _auth = FirebaseAuth.instance;


  //registration
  void _registerUser() async {
    User firebaseUser;
    await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim()
    ).then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return displayDialogue(error.toString());
          });
    }
    );

    if (firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => NavBar());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "name": _nameTextController.text.trim(),
      //"url": url,
      "userCart": ["garbageValue"],
    });

    await sharedPreferences.setString("uid", user.uid);
    await sharedPreferences.setString("email", user.email);
    await sharedPreferences.setString("name", _nameTextController.text);
    //await sharedPreferences.setString("url", url);
    await sharedPreferences.setStringList("userCart", ["garbageValue"]);
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

class UserServices{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).doc(data["userId"]).set(data);
  }
}



/* Net ninja
final FirebaseAuth auth = FirebaseAuth.instance;
class AuthService{



  //create a user object based on User
  TheUser userFromTheUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser> get user {
    return auth.authStateChanges()
    //.map((User user) => _userFromTheUser(user));
        .map(userFromTheUser);
  }

  //sign in anom
  Future signInAnom() async{
    try{
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      return userFromTheUser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }
  //registration
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return userFromTheUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

    //sign in
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return userFromTheUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }

  }
}

class TheUser {

  final String uid;
  TheUser({
    this.uid,
  });
}*/
