import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question5.dart';
import 'package:book_rent_app_chapter3/model/quiz_data_model.dart';

//ignore: must_be_immutable
class Question4 extends StatefulWidget {
<<<<<<< HEAD:lib/QuizScreens/Question4.dart
  QuizData? quizData = QuizData();
  Question4({this.quizData});
=======
  QuizData quizData = QuizData();
  Question4({Key? key, required this.quizData}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/QuizScreens/question4.dart

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
  String? chosen;
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
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: const Icon(Icons.navigate_next_rounded),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>
                              Question5(
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
                    'Question 4',
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
                    'What are you most likely to do?',
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
                            widget.fsg += 1;
                            widget.quizData!.fsg += widget.fsg;
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
                            widget.tgdt += 1;
                            widget.quizData!.tgdt += widget.tgdt;
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
                            widget.aad += 1;
                            widget.quizData!.aad += widget.aad;
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
                            widget.pw += 1;
                            widget.csms += 1;
                            widget.eu += 1;
                            widget.quizData!.pw += widget.pw;
                            widget.quizData!.csms += widget.csms;
                            widget.quizData!.eu += widget.eu;
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
                      widget.quizData!.fsg -= 1;
                    } else if (chosen == option2) {
                      widget.quizData!.tgdt -= 1;
                    } else if (chosen == option3) {
                      widget.quizData!.aad -= 1;
                    } else if (chosen == option4) {
                      widget.quizData!.pw -= 1;
                      widget.quizData!.csms -= 1;
                      widget.quizData!.eu -= 1;
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
                child: const Text('Reset'),
              ),
            ],
          )),
    );
  }
}
