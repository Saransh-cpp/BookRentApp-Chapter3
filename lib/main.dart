import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/login_page.dart';
import 'package:book_rent_app_chapter3/Screens/nav_bar.dart';
import 'package:book_rent_app_chapter3/Screens/splash.dart';
import 'package:book_rent_app_chapter3/provider/app.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:flutter/services.dart';
import 'package:wiredash/wiredash.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  // Preload all assets to prevent flash when they are loaded.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) {
    const Splash();
    binding.allowFirstFrame();
  });
  if (Firebase.apps.isEmpty) {
    if (kIsWeb) {
      await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDKcTjW2TTKLHq-kKeuSGJda9cpipv8eFE",
          appId: "1:212895190763:web:ce93ccbf38d7bf823678ae",
          messagingSenderId: "212895190763",
          projectId: "chapter3-3a6ab"),
      );
    } else {
      await Firebase.initializeApp();
    }
  } else {
    Firebase.app();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({Key? key}) : super(key: key);

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
      child: Wiredash(
          projectId: "chapter3-1ym21le",
          secret: "A2XCs2mC48QPiCAFboCRRHzChA42S5BM",
          navigatorKey: _navigatorKey,
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false, home: const ScreensController()),
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  const ScreensController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return const Splash();
      case Status.Unauthenticated:
        return const LoginPage();
      case Status.Authenticating:
        return const LoginPage();
      case Status.Authenticated:
        return const NavBar();
      default:
        return const LoginPage();
    }
  }
}
