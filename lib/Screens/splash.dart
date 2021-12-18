import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Image.asset(
        'images/chapter3Logo.png',
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
