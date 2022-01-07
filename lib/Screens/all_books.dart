import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/widgets.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);

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
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: const [
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
