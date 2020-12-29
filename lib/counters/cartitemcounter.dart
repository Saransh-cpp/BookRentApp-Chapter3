import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:test_app/config/config.dart';


class CartItemCounter with ChangeNotifier {

  int _counter = BookApp.sharedPreferences.getStringList(BookApp.userCartList).length-1;
  int get count => _counter;
}