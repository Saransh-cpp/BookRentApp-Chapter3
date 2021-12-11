import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/splash.dart';
import 'package:test_app/provider/app.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/provider/user.dart';


Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  // Preload all assets to prevent flash when they are loaded.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) {
    BuildContext context = binding.renderViewElement;
    if (context != null) {
      // Run any sync or awaited async function you want to wait for before showing your UI
      Splash();
    }
    binding.allowFirstFrame();
  });
  await Firebase.initializeApp();
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
