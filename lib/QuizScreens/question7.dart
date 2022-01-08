import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/model/quiz_data_model.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question8.dart';

//ignore: must_be_immutable
class Question7 extends StatefulWidget {
<<<<<<< HEAD:lib/QuizScreens/Question7.dart
  QuizData? quizData = QuizData();
  Question7({this.quizData});
=======
  QuizData quizData = QuizData();
  Question7({Key? key, required this.quizData}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/QuizScreens/question7.dart

  @override
  _Question7State createState() => _Question7State();

  int aad = 0;
  int ts = 0;
  int kr = 0;
  int hppa = 0;
}

class _Question7State extends State<Question7> {
  String? chosen;
  bool answered = false;
  String option1 = 'I love when books make my heart\nbeat faster';
  String option2 = 'I love when the book keeps me\nguessing';
  String option3 = 'I love when the book makes me\nugly cry';
  String option4 =
      'I love when the protagonists fall in\nlove and have a happy ending ';

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
                              Question8(
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
                    'Question 7',
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
                    'What is your favorite part about a book?',
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
                            widget.quizData!.hppa += widget.hppa;
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
                            widget.aad += 1;
                            widget.quizData!.aad += widget.aad;
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
                            widget.kr += 1;
                            widget.quizData!.kr += widget.kr;
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
                            widget.ts += 1;
                            widget.quizData!.ts += widget.ts;
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
                      widget.quizData!.hppa -= 1;
                    } else if (chosen == option2) {
                      widget.quizData!.aad -= 1;
                    } else if (chosen == option3) {
                      widget.quizData!.kr -= 1;
                    } else if (chosen == option4) {
                      widget.quizData!.ts -= 1;
                    }
                    chosen = '';
                    answered = false;
                    widget.hppa = 0;
                    widget.ts = 0;
                    widget.kr = 0;
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
