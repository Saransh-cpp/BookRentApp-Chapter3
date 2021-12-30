import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/LoginPage.dart';
import 'package:book_rent_app_chapter3/Screens/NavBar.dart';
import 'package:book_rent_app_chapter3/Screens/splash.dart';
import 'package:book_rent_app_chapter3/provider/app.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  // Preload all assets to prevent flash when they are loaded.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) {
    BuildContext context = binding.renderViewElement!;
    if (context != null) {
      Splash();
    }
    binding.allowFirstFrame();
  });
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyCdQgjJ7kTZ_NxrW-1ReuvInOYyXJTwRTA", appId: "1:154108809680:web:f0f9b39d6f5bdbfbfb29d5", messagingSenderId: "154108809680", projectId: "bookrentapp"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: ScreensController()),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
        return LoginPage();
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return NavBar();
      default:
        return LoginPage();
    }
  }
}
