import 'package:flutter/material.dart';

class YourOrders extends StatefulWidget {
  @override
  _YourOrdersState createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: Center(
            child: Container(
              child: Text(
                  'Orders'),
            ),
          ),
        ),
      ),
    );
  }
}
