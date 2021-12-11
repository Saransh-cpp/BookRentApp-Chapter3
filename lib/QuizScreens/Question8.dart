import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question9.dart';
//import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

//ignore: must_be_immutable
class Question8 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question8({this.quizData});

  @override
  _Question8State createState() => _Question8State();

  int csms = 0;
  int eu = 0;
  int pw = 0;
  int fsg = 0;
  int kr = 0;
  int tug = 0;

}

class _Question8State extends State<Question8> {

  String chosen;
  bool answered = false;
  String option1 = 'I wanna be happy and filled with\npositivity';
  String option2 = 'Tear jerker, Hit me with a solid\nemotional story';
  String option3 = 'Hot and steamy romance pls';
  String option4 = 'Send my brain for a jog, give me facts\nand knowledge';

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
            actions: [
              IconButton(
                icon: Icon(Icons.navigate_next_rounded),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question9(
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
                    'Question 8',
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
                    'What is your favorite part about a book?',
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
                            widget.tug += 1;
                            widget.quizData.tug += widget.tug;
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
                            widget.fsg += 1;
                            widget.quizData.fsg += widget.fsg;
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
                      widget.quizData.tug -= 1;
                    }
                    else if (chosen == option2) {
                      widget.quizData.kr -= 1;
                    }
                    else if (chosen == option3) {
                      widget.quizData.fsg -= 1;
                    }
                    else if (chosen == option4) {
                      widget.quizData.eu -= 1;
                      widget.quizData.csms -= 1;
                      widget.quizData.pw -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.tug = 0;
                    widget.fsg = 0;
                    widget.kr = 0;
                    widget.eu = 0;
                    widget.csms = 0;
                    widget.pw = 0;
                  });
                },
                child: Text('Reset'),
              ),
            ],
          )
      ),
    );
  }
}