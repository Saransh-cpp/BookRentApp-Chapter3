

import 'package:flutter/material.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Screens/Settings.dart';
import 'package:test_app/Screens/YourOrders.dart';
import 'package:test_app/Screens/AllBooks.dart';
import 'package:test_app/Screens/product_details.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => NavBar(),
      '/login': (context) => LoginPage(),
      '/settings': (context) =>Settings(),
      '/orders': (context) => YourOrders(),
      '/allbooks': (context) => AllBooks(),
      '/product_details': (context) => ProductDetails(),

    },
  )
  );
}

