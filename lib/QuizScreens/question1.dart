import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question2.dart';
import 'package:book_rent_app_chapter3/model/quiz_data_model.dart';

// ignore: must_be_immutable
class Question1 extends StatefulWidget {
  final QuizData quizData = QuizData();

  Question1({Key? key}) : super(key: key);

  @override
  _Question1State createState() => _Question1State();

  int tgdt = 0;
  int tug = 0;
  int pfo = 0;
  int aad = 0;
}

class _Question1State extends State<Question1> {
  String? chosen;
  bool answered = false;
  String option1 = 'Bold, fierce, strong headed';
  String option2 = 'Lively, Extrovert, Cheerful';
  String option3 = 'Nerdy, Introvert, Creative, Quite';
  String option4 = 'Smart, Ambivert, Intellectual';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: const Icon(Icons.navigate_next_rounded),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>
                              Question2(
                                quizData: widget.quizData,
                              )));
                },
              )
            ],
          ),
          body: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Question 1',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    'What personality trait do you resonate with\nthe most?',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
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
                            widget.quizData.tgdt += widget.tgdt;
                          });
                          // ignore: avoid_print
                          print(widget.quizData.tgdt);
                        }
                      },
                      child: Container(
                          color: chosen == option1
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            const Text(
                              'A',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              option1,
                              style:
                              const TextStyle(color: Colors.black,
                                  fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option2;
                            answered = true;
                            widget.tug += 1;
                            widget.quizData.tug += widget.tug;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option2
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            const Text(
                              'B',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              option2,
                              style:
                              const TextStyle(color: Colors.black,
                                  fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option3;
                            answered = true;
                            widget.pfo += 1;
                            widget.quizData.pfo += widget.pfo;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option3
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            const Text(
                              'C',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              option3,
                              style:
                              const TextStyle(color: Colors.black,
                                  fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option4;
                            answered = true;
                            widget.aad += 1;
                            widget.quizData.aad += widget.aad;
                          });
                        }
                      },
                      child: Container(
                          color: chosen == option4
                              ? Colors.blueAccent
                              : Colors.white,
                          child: Row(children: [
                            const Text(
                              'D',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              option4,
                              style:
                              const TextStyle(color: Colors.black,
                                  fontSize: 20),
                            )
                          ])))
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (chosen == option1) {
                      widget.quizData.tgdt -= 1;
                    } else if (chosen == option2) {
                      widget.quizData.tug -= 1;
                    } else if (chosen == option3) {
                      widget.quizData.pfo -= 1;
                    } else if (chosen == option4) {
                      widget.quizData.aad -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.tgdt = 0;
                    widget.pfo = 0;
                    widget.aad = 0;
                    widget.tug = 0;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          )),
    );
  }
}
