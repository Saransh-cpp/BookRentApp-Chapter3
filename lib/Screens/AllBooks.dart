import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:test_app/Widgets.dart';
//import 'package:test_app/provider/product.dart';
//import 'package:test_app/provider/user.dart';
//import 'package:test_app/services/product.dart';

class AllBooks extends StatefulWidget {
  @override
  _AllBooksState createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              PerGenre(
                genre: 'Astrophysics',
              ),
              PerGenre(
                genre: 'Horror',
              ),
              PerGenre(
                genre: 'Science Fiction',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
