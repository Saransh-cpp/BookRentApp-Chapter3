import 'package:flutter/material.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();

  int tgdt = 0;
  int tug = 0;
  int pfo = 0;
  int aad = 0;

  returnBook(){

  }

}

class _Question1State extends State<Question1> {

  String chosen;
  bool answered = false;
  String option1 = 'Bold, fierce, strong headed';
  String option2 = 'Lively, Extrovert, Cheerful';
  String option3 = 'Nerdy, Introvert, Creative, Quite';
  String option4 = 'Smart, Ambivert, Intellectual';

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
                    'What personality trait do you resonate with\nthe most?',
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
                            widget.tgdt += 1;
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
                            widget.tug += 1;
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
                            widget.pfo += 1;
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
                            widget.aad += 1;
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
                      chosen = '';
                      answered = false;
                      widget.tgdt = 0;
                      widget.pfo = 0;
                      widget.aad = 0;
                      widget.tug = 0;
                    });
                  },
                child: Text('Reset'),
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => QuizResult(
                      tgdt: widget.tgdt,
                      pfo: widget.pfo,
                      tug: widget.tug,
                      aad: widget.aad,
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
