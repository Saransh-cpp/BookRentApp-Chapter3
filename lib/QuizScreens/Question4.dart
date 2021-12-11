import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question5.dart';
//import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

class Question4 extends StatefulWidget {
  QuizData quizData = QuizData();
  Question4({this.quizData});

  @override
  _Question4State createState() => _Question4State();

  int csms = 0;
  int eu = 0;
  int pw = 0;
  int aad = 0;
  int tgdt = 0;
  int fsg = 0;
}

class _Question4State extends State<Question4> {
  String chosen;
  bool answered = false;
  String option1 = 'Fall in love with a\nbillionaire';
  String option2 =
      'Be a prominent figure in the\ninternational Hacker community';
  String option3 =
      'Take a break from your regular\njob and solve mysteries\nand save the world';
  String option4 = 'Unravel the complexities\n of the universe';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: Icon(Icons.navigate_next_rounded),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) => Question5(
                                quizData: widget.quizData,
                              )));
                },
              )
            ],
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Question 4',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'What are you most likely to do?',
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                            widget.fsg += 1;
                            widget.quizData.fsg += widget.fsg;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option1
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            Text(
                              'A',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              option1,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option2;
                            answered = true;
                            widget.tgdt += 1;
                            widget.quizData.tgdt += widget.tgdt;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option2
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            Text(
                              'B',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              option2,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
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
                          color: chosen == option3
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            Text(
                              'C',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              option3,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option4;
                            answered = true;
                            widget.pw += 1;
                            widget.csms += 1;
                            widget.eu += 1;
                            widget.quizData.pw += widget.pw;
                            widget.quizData.csms += widget.csms;
                            widget.quizData.eu += widget.eu;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option4
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            Text(
                              'D',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              option4,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ])))
                ],
              ),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (chosen == option1) {
                      widget.quizData.fsg -= 1;
                    } else if (chosen == option2) {
                      widget.quizData.tgdt -= 1;
                    } else if (chosen == option3) {
                      widget.quizData.aad -= 1;
                    } else if (chosen == option4) {
                      widget.quizData.pw -= 1;
                      widget.quizData.csms -= 1;
                      widget.quizData.eu -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.eu = 0;
                    widget.csms = 0;
                    widget.tgdt = 0;
                    widget.pw = 0;
                    widget.fsg = 0;
                    widget.aad = 0;
                  });
                },
                child: Text('Reset'),
              ),
            ],
          )),
    );
  }
}
