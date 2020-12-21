import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Screens/Settings.dart';
import 'package:test_app/Screens/YourOrders.dart';
import 'package:test_app/Screens/AllBooks.dart';
import 'package:test_app/Screens/product_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/Wrapper.dart';
import 'package:test_app/Screens/Register.dart';

//fluttertoast: ^7.1.5
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //Firestore firestore = Firestore.instance;
  runApp(//StreamProvider<TheUser>.value(
    //value: AuthService().user,
    //child:
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => NavBar(),
        //'/login': (context) => LoginPage(),
        //'/settings': (context) =>Settings(),
        '/orders': (context) => YourOrders(),
        '/allbooks': (context) => AllBooks(),
        '/product_details': (context) => ProductDetails(),

      },
    ),
  );
}

