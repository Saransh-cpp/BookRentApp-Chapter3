import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question4.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

class Question3 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question3({this.quizData});

  @override
  _Question3State createState() => _Question3State();

  int ts = 0;
  int aad = 0;
  int pfo = 0;
  int fsg = 0;

}

class _Question3State extends State<Question3> {

  String chosen;
  bool answered = false;
  String option1 = 'I believe in soulmates';
  String option2 = 'A love triangle because I\'m\nconfused';
  String option3 = 'Single forever gang';
  String option4 = 'I don\'t date, I hookup';

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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question4(
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
                    'Question 3',
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
                    'What sort of romance do you like?',
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
                            widget.pfo += 1;
                            widget.quizData.pfo += widget.pfo;
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
                            widget.ts += 1;
                            widget.quizData.ts += widget.ts;
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
                            widget.fsg += 1;
                            widget.quizData.fsg += widget.fsg;
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
                      widget.quizData.pfo -= 1;
                    }
                    else if (chosen == option2) {
                      widget.quizData.ts -= 1;
                    }
                    else if (chosen == option3) {
                      widget.quizData.aad -= 1;
                    }
                    else if (chosen == option4) {
                      widget.quizData.fsg -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.ts = 0;
                    widget.pfo = 0;
                    widget.fsg = 0;
                    widget.aad = 0;
                  });
                },
                child: Text('Reset'),
              ),
              // MaterialButton(
              //   onPressed: () {
              //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) =>
              //         QuizResult(
              //           quizData: widget.quizData,
              //         )));
              //   },
              //   child: Text(
              //       'Result'
              //   ),
              // )
            ],
          )
      ),
    );
  }
}
