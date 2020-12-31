// import 'package:flutter/material.dart';
// import 'package:test_app/model/user.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:test_app/provider/product.dart';
// import 'package:test_app/Screens/Loading.dart';

// class EditProfile extends StatefulWidget {
//   final String currentUserId;
//
//   EditProfile({this.currentUserId});
//
//   @override
//   _EditProfileState createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController displayNameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   bool isLoading = false;
//   User user;
//   bool _displayNameValid = true;
//   bool _bioValid = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getUser();
//   }
//
//   getUser() async {
//     setState(() {
//       isLoading = true;
//     });
//     DocumentSnapshot doc = await usersRef.document(widget.currentUserId).get();
//     user = User.fromDocument(doc);
//     displayNameController.text = user.displayName;
//     bioController.text = user.bio;
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   Column buildDisplayNameField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//             padding: EdgeInsets.only(top: 12.0),
//             child: Text(
//               "Display Name",
//               style: TextStyle(color: Colors.grey),
//             )),
//         TextField(
//           controller: displayNameController,
//           decoration: InputDecoration(
//             hintText: "Update Display Name",
//             errorText: _displayNameValid ? null : "Display Name too short",
//           ),
//         )
//       ],
//     );
//   }
//
//   Column buildBioField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "Bio",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: bioController,
//           decoration: InputDecoration(
//             hintText: "Update Bio",
//             errorText: _bioValid ? null : "Bio too long",
//           ),
//         )
//       ],
//     );
//   }
//
//   updateProfileData() {
//     setState(() {
//       displayNameController.text.trim().length < 3 ||
//           displayNameController.text.isEmpty
//           ? _displayNameValid = false
//           : _displayNameValid = true;
//       bioController.text.trim().length > 100
//           ? _bioValid = false
//           : _bioValid = true;
//     });
//
//     if (_displayNameValid && _bioValid) {
//       usersRef.document(widget.currentUserId).updateData({
//         "displayName": displayNameController.text,
//         "bio": bioController.text,
//       });
//       SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
//       _scaffoldKey.currentState.showSnackBar(snackbar);
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.done,
//               size: 30.0,
//               color: Colors.green,
//             ),
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Loading()
//           : ListView(
//         children: <Widget>[
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(
//                     top: 16.0,
//                     bottom: 8.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage:
//                     NetworkImage(user.photoUrl),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       buildDisplayNameField(),
//                       buildBioField(),
//                     ],
//                   ),
//                 ),
//                 RaisedButton(
//                   onPressed: updateProfileData,
//                   child: Text(
//                     "Update Profile",
//                     style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: FlatButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.cancel, color: Colors.red),
//                     label: Text(
//                       "Logout",
//                       style: TextStyle(color: Colors.red, fontSize: 20.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class UserProfilePage extends StatefulWidget {
//   @override
//   _UserProfilePageState createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   UserModel userModel;
//   TextEditingController phoneNumber;
//   TextEditingController address;
//   TextEditingController userName;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String picture;
//   void validation() async {
//     if (userName.text.isEmpty && phoneNumber.text.isEmpty) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           content: Text("All Flied Are Empty"),
//         ),
//       );
//     } else if (userName.text.isEmpty) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           content: Text("Name Is Empty "),
//         ),
//       );
//     } else if (userName.text.length < 6) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           content: Text("Name Must Be 6 "),
//         ),
//       );
//     } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           content: Text("Phone Number Must Be 11 "),
//         ),
//       );
//     } else {
//       userDetailUpdate();
//     }
//   }
//
//   File _pickedImage;
//
//   void getImage(Future<File> pickImage) async {
//     File tempImg = await pickImage;
//     _pickedImage = tempImg;
//   }
//
//   Widget _displayChild1() {
//     if (_pickedImage == null) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
//         child: new Icon(Icons.add, color: Colors.grey,),
//       );
//     } else {
//       return Image.file(_pickedImage, fit: BoxFit.fill, width: double.infinity,);
//     }
//   }
//
//   String userUid;
//
//   Future<String> _uploadImage({File image}) async {
//     final FirebaseStorage storage = FirebaseStorage.instance;
//
//     picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
//     Reference reference = storage.ref().child(picture);
//     await reference.putFile(_pickedImage);
//
//     String imageUrl1 = await reference.getDownloadURL();
//   }
//
//   void getUserUid() {
//     User myUser = FirebaseAuth.instance.currentUser;
//     userUid = myUser.uid;
//   }
//
//   bool centerCircle = false;
//   var imageMap;
//   void userDetailUpdate() async {
//     setState(() {
//       centerCircle = true;
//     });
//     _pickedImage != null
//         ? imageMap = await _uploadImage(image: _pickedImage)
//         : Container();
//     FirebaseFirestore.instance.collection("users").doc(userUid).update({
//       "UserName": userName.text,
//       "UserNumber": phoneNumber.text,
//       "UserImage": imageMap,
//       "UserAddress": address.text
//     });
//     setState(() {
//       centerCircle = false;
//     });
//     setState(() {
//       edit = false;
//     });
//   }
//
//   Widget _buildSingleContainer(
//       {Color color, String startText, String endText}) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         height: 55,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: edit == true ? color : Colors.white,
//           borderRadius: edit == false
//               ? BorderRadius.circular(30)
//               : BorderRadius.circular(0),
//         ),
//         width: double.infinity,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               startText,
//               style: TextStyle(fontSize: 17, color: Colors.black45),
//             ),
//             Text(
//               endText,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String userImage;
//   bool edit = false;
//   Widget _buildContainerPart() {
//     address = TextEditingController(text: userModel.address);
//     userName = TextEditingController(text: userModel.name);
//     phoneNumber = TextEditingController(text: userModel.number);
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildSingleContainer(
//             endText: userModel.name,
//             startText: "Name",
//           ),
//           _buildSingleContainer(
//             endText: userModel.email,
//             startText: "Email",
//           ),
//           _buildSingleContainer(
//             endText: userModel.number,
//             startText: "Phone Number",
//           ),
//           _buildSingleContainer(
//             endText: userModel.address,
//             startText: "Address",
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> myDialogBox(context) {
//     return showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.camera_alt),
//                     title: Text("Pick Form Camera"),
//                     onTap: () {
//                       getImage(ImagePicker.pickImage(
//                         source: ImageSource.camera
//                       ));
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.photo_library),
//                     title: Text("Pick Form Gallery"),
//                     onTap: () {
//                       getImage(ImagePicker.pickImage(
//                           source: ImageSource.gallery
//                       ));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   Widget _buildTextFormFliedPart() {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           MyTextFormField(
//             name: "UserName",
//             controller: userName,
//           ),
//           _buildSingleContainer(
//             color: Colors.grey[300],
//             endText: userModel.email,
//             startText: "Email",
//           ),
//           MyTextFormField(
//             name: "Phone Number",
//             controller: phoneNumber,
//           ),
//           MyTextFormField(
//             name: "Address",
//             controller: address,
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getUserUid();
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       key: _scaffoldKey,
//       backgroundColor: Color(0xfff8f8f8),
//       appBar: AppBar(
//         leading: edit == true
//             ? IconButton(
//           icon: Icon(
//             Icons.close,
//             color: Colors.redAccent,
//             size: 30,
//           ),
//           onPressed: () {
//             setState(() {
//               edit = false;
//             });
//           },
//         )
//             : IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black45,
//             size: 30,
//           ),
//           onPressed: () {
//             setState(() {
//               Navigator.of(context).pop();
//             });
//           },
//         ),
//         backgroundColor: Colors.white,
//         actions: [
//           edit == false
//               ? SizedBox(
//             height: 0,
//               width: 0,
//           )
//               : IconButton(
//             icon: Icon(
//               Icons.check,
//               size: 30,
//               color: Color(0xff746bc9),
//             ),
//             onPressed: () {
//               validation();
//             },
//           ),
//         ],
//       ),
//       body: centerCircle == false
//           ? ListView(
//         children: [
//           StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection("users")
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 // var myDoc = snapshot.data.docs;
//                 // myDoc.forEach((checkDocs) {
//                 //   if (checkDocs.data()["UserId"] == userUid) {
//                 //     userModel = UserModel.fromSnapshot(
//                 //       // userEmail: checkDocs.data()["UserEmail"],
//                 //       // userImage: checkDocs.data()["UserImage"],
//                 //       // userAddress: checkDocs.data()["UserAddress"],
//                 //       // userGender: checkDocs.data()["UserGender"],
//                 //       // userName: checkDocs.data()["UserName"],
//                 //       // userPhoneNumber: checkDocs.data()["UserNumber"],
//                 //     );
//                 //   }
//                 // });
//                 return Container(
//                   height: 603,
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             height: 200,
//                             width: double.infinity,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                     height: 50,
//                                     width: 50,
//                                     child: _displayChild1()
//                                 ),
//                               ],
//                             ),
//                           ),
//                           edit == true
//                               ? Padding(
//                             padding: EdgeInsets.only(
//                                 left: MediaQuery.of(context)
//                                     .viewPadding
//                                     .left +
//                                     220,
//                                 top: MediaQuery.of(context)
//                                     .viewPadding
//                                     .left +
//                                     110),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                 BorderRadius.circular(20),
//                               ),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   myDialogBox(context);
//                                 },
//                                 child: CircleAvatar(
//                                   backgroundColor:
//                                   Colors.transparent,
//                                   child: Icon(
//                                     Icons.camera_alt,
//                                     color: Color(0xff746bc9),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                               : Container(),
//                         ],
//                       ),
//                       Container(
//                         height: 350,
//                         width: double.infinity,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 child: edit == true
//                                     ? _buildTextFormFliedPart()
//                                     : _buildContainerPart(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: edit == false
//                               ? MaterialButton(
//                             child: Text(
//                               'Press'
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 edit = true;
//                               });
//                             },
//                           )
//                               : Container(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ],
//       )
//           : Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// class MyTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String name;
//
//   MyTextFormField({
//     this.controller,
//     this.name,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: name,
//       ),
//     );
//   }
// }


// class NotificationButton extends StatefulWidget {
//   @override
//   _NotificationButtonState createState() => _NotificationButtonState();
// }

// class _NotificationButtonState extends State<NotificationButton> {
//   ProductProvider productProvider;
//   Future<void> myDialogBox(context) {
//     return showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Alert"),
//             actions: [
//               FlatButton(
//                 child: Text("Clear Notification"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     productProvider.notificationList.clear();
//                   });
//                 },
//               ),
//               FlatButton(
//                 child: Text("Okey"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   Text(productProvider.notificationList.isNotEmpty
//                       ? "Your Product On Way"
//                       : "No Notification At Yet"),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     productProvider = Provider.of<ProductProvider>(context);
//     return Badge(
//       position: BadgePosition(left: 25, top: 8),
//       badgeContent: Text(
//         productProvider.getNotificationIndex.toString(),
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//       badgeColor: Colors.red,
//       child: IconButton(
//         icon: Icon(
//           Icons.notifications_none,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           myDialogBox(context);
//         },
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Utility/auth.dart';
import 'package:test_app/config/config.dart';
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


