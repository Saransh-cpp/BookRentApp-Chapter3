import 'package:flutter/material.dart';
import 'package:test_app/Widgets.dart';

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
                          Container(
                            color: Colors.pink[50],
                            height: 20,
                            width: 500,
                            child: Center(
                              child: Text(
                                'Genre 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,

                                ),
                              ),
                            ),
                          ),
                          Products(),
                          Container(
                            height: 20,
                            width: 500,
                            child: Center(
                              child: Text(
                                'Genre 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,

                                ),
                              ),
                            ),
                          ),
                          Products(),
                        ],

                     ),
        ),
      ),
            );



  }
}
