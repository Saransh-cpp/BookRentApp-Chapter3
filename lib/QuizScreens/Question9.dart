import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

class Question9 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question9({this.quizData});

  @override
  _Question9State createState() => _Question9State();

  int csms = 0;
  int eu = 0;
  int pw = 0;
  int aad = 0;
  int kr = 0;
  int ts = 0;

}

class _Question9State extends State<Question9> {

  String chosen;
  bool answered = false;
  String option1 = 'The boldness of asking deep\nquestions may require unforeseen\nflexibility if we are to\naccept the answers.';
  String option2 = 'For you, a thousand times over.';
  String option3 = 'There is some good in this world,\nand it’s worth fighting for.';
  String option4 = 'Whatever our souls are made of,\nhis and mine are the same.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
                color: Colors.black
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.navigate_next_rounded),
            //     onPressed: () {
            //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => ))
            //     },
            //   )
            // ],
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Question 9',
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
                    'Choose a quote',
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
                            widget.csms += 1;
                            widget.eu += 1;
                            widget.pw += 1;
                            widget.quizData.csms += widget.csms;
                            widget.quizData.eu += widget.eu;
                            widget.quizData.pw += widget.pw;
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
                            widget.kr += 1;
                            widget.quizData.kr += widget.kr;
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
                            widget.aad += 1;
                            widget.quizData.aad += widget.aad;
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
                            widget.ts += 1;
                            widget.quizData.ts += widget.ts;
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
              SizedBox(height: 100,),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (chosen == option1) {
                      widget.quizData.eu -= 1;
                      widget.quizData.csms -= 1;
                      widget.quizData.pw -= 1;
                    }
                    else if (chosen == option2) {
                      widget.quizData.kr -= 1;
                    }
                    else if (chosen == option3) {
                      widget.quizData.aad -= 1;
                    }
                    else if (chosen == option4) {
                      widget.quizData.ts -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.ts = 0;
                    widget.aad = 0;
                    widget.kr = 0;
                    widget.eu = 0;
                    widget.csms = 0;
                    widget.pw = 0;
                  });
                },
                child: Text('Reset'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) =>
                      QuizResult(
                        quizData: widget.quizData,
                      )));
                },
                child: Text(
                    'Result'
                ),
              )
            ],
          )
      ),
    );
  }
}