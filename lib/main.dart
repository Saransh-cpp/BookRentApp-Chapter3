import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Screens/Home.dart';
import 'package:test_app/Screens/splash.dart';
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
import 'package:test_app/config/config.dart';
import 'package:test_app/counters/BookedQuantity.dart';
import 'package:test_app/counters/totalMoney.dart';
import 'package:test_app/provider/app.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/provider/user.dart';

import 'counters/cartitemcounter.dart';
import 'counters/changeAddress.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BookApp.firestore = FirebaseFirestore.instance;
  BookApp.sharedPreferences = await SharedPreferences.getInstance();
  BookApp.auth = FirebaseAuth.instance;
  //FirebaseAuth auth = FirebaseAuth.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider()),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ScreensController()
        ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return NavBar();
      default: return LoginPage();
    }
  }
}

/*class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 5), () async{
      if(await BookApp.auth.currentUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NavBar()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text(
            'Redirecting',
            style: TextStyle(
              fontSize: 28
            ),
          ),
        )
    );
  }
}*/



