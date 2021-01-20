import 'package:flutter/material.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {

  String chosen;
  bool answered = false;
  String option1 = 'option1';
  String option2 = 'option2';
  String option3 = 'option3';
  String option4 = 'option4';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Question 1',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Question',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option1;
                            answered = true;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option1 ?
                          Colors.blueAccent :
                          Colors.white,
                          child: Row(
                              children: [
                                Text(
                                  'A',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  option1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ]
                          )
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option2;
                            answered = true;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option2 ?
                          Colors.blueAccent :
                          Colors.white,
                          child: Row(
                              children: [
                                Text(
                                  'B',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  option2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ]
                          )
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option3;
                            answered = true;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option3 ?
                          Colors.blueAccent :
                          Colors.white,
                          child: Row(
                              children: [
                                Text(
                                  'C',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  option3,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ]
                          )
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option4;
                            answered = true;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option4 ?
                          Colors.blueAccent :
                          Colors.white,
                          child: Row(
                              children: [
                                Text(
                                  'D',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  option4,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ]
                          )
                      )
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
