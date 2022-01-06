import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question4.dart';
import 'package:book_rent_app_chapter3/model/quiz_data_model.dart';

//ignore: must_be_immutable
class Question3 extends StatefulWidget {
  QuizData quizData = QuizData();
  Question3({Key? key, required this.quizData}) : super(key: key);

  @override
  _Question3State createState() => _Question3State();

  int ts = 0;
  int aad = 0;
  int pfo = 0;
  int fsg = 0;
}

class _Question3State extends State<Question3> {
  String? chosen;
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
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: const Icon(Icons.navigate_next_rounded),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>
                              Question4(
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
                    'Question 3',
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
                    'What sort of romance do you like?',
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
                            widget.pfo += 1;
                            widget.quizData.pfo += widget.pfo;
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
                            widget.fsg += 1;
                            widget.quizData.fsg += widget.fsg;
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
                      widget.quizData.pfo -= 1;
                    } else if (chosen == option2) {
                      widget.quizData.ts -= 1;
                    } else if (chosen == option3) {
                      widget.quizData.aad -= 1;
                    } else if (chosen == option4) {
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
                child: const Text('Reset'),
              ),
            ],
          )),
    );
  }
}
