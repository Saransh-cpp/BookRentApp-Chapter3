import 'package:flutter/material.dart';

class AllBooks extends StatefulWidget {
  @override
  _AllBooksState createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
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
                  'Books'
              ),
            ),
          ),
        ),
      ),
    );
  }
}
