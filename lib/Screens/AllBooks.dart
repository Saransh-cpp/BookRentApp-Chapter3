import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/Widgets.dart';

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
