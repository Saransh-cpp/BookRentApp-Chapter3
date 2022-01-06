import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question6.dart';
import 'package:book_rent_app_chapter3/model/quiz_data_model.dart';

//ignore: must_be_immutable
class Question5 extends StatefulWidget {
  QuizData quizData = QuizData();
  Question5({Key? key, required this.quizData}) : super(key: key);

  @override
  _Question5State createState() => _Question5State();

  int csms = 0;
  int eu = 0;
  int ts = 0;
  int kr = 0;
  int hppa = 0;
}

class _Question5State extends State<Question5> {
  String? chosen;
  bool answered = false;
  String option1 = 'A closely knit group of 3-5 people';
  String option2 =
      'I can befriend every person on this\nplanet because I\'m awesome';
  String option3 = 'Idk, I\'m a loner';
  String option4 = '1 bestfriend who\'s everything to me';

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
                              Question6(
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
                    'Question 5',
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
                    'Choose your social circle',
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
                            widget.hppa += 1;
                            widget.quizData.hppa += widget.hppa;
                          });
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
                              const TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
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
                              const TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option3;
                            answered = true;
                            widget.eu += 1;
                            widget.csms += 1;
                            widget.quizData.eu += widget.eu;
                            widget.quizData.csms += widget.csms;
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
                              const TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ]))),
                  GestureDetector(
                      onTap: () {
                        if (!answered) {
                          setState(() {
                            chosen = option4;
                            answered = true;
                            widget.kr += 1;
                            widget.quizData.kr += widget.kr;
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
                              const TextStyle(color: Colors.black, fontSize: 20),
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
                      widget.quizData.hppa -= 1;
                    } else if (chosen == option2) {
                      widget.quizData.ts -= 1;
                    } else if (chosen == option3) {
                      widget.quizData.csms -= 1;
                      widget.quizData.eu -= 1;
                    } else if (chosen == option4) {
                      widget.quizData.kr -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.eu = 0;
                    widget.csms = 0;
                    widget.ts = 0;
                    widget.kr = 0;
                    widget.hppa = 0;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          )),
    );
  }
}
