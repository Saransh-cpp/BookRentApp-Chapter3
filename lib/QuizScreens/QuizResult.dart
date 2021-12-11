import 'package:flutter/material.dart';
//import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/model/QuizDataModel.dart';
//import 'dart:math';
import 'package:quiver/iterables.dart' as quiver;

class QuizResult extends StatefulWidget {
  final QuizData quizData;

  const QuizResult({Key key, this.quizData}) : super(key: key);

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    String bookSuggestion = '';
    List<int> books = [
      widget.quizData.aad,
      widget.quizData.pfo,
      widget.quizData.tug,
      widget.quizData.tgdt,
      widget.quizData.hppa,
      widget.quizData.eu,
      widget.quizData.csms,
      widget.quizData.pw,
      widget.quizData.fsg,
      widget.quizData.ts,
      widget.quizData.kr
    ];
    int maxBook = quiver.max(books);

    if (maxBook == 0) {
      bookSuggestion = 'Please attempt the quiz first';
    } else {
      if (widget.quizData.aad == maxBook) {
        print(maxBook);
        bookSuggestion = bookSuggestion + '\nAngels and Demons';
      }
      if (widget.quizData.tug == maxBook) {
        print(maxBook);
        bookSuggestion += '\nThe Undomestic Goddess';
      }
      if (widget.quizData.tgdt == maxBook) {
        print(maxBook);
        bookSuggestion += '\nThe Girl with the Dragon Tattoo';
      }
      if (widget.quizData.hppa == maxBook) {
        bookSuggestion += '\nHarry Potter and the prisoner of Azkaban';
      }
      if (widget.quizData.pfo == maxBook) {
        print(maxBook);
        bookSuggestion += '\nParis for One';
      }
      if (widget.quizData.ts == maxBook) {
        print(maxBook);
        bookSuggestion += '\nThe Selection';
      }
      if (widget.quizData.fsg == maxBook) {
        print(maxBook);
        bookSuggestion += '\nFifty Shades of grey';
      }
      if (widget.quizData.pw == maxBook) {
        print(maxBook);
        bookSuggestion += '\nParallel Worlds';
      }
      if (widget.quizData.csms == maxBook) {
        print(maxBook);
        bookSuggestion += '\nCosmos';
      }
      if (widget.quizData.eu == maxBook) {
        print(maxBook);
        bookSuggestion += '\nElegant Universe';
      }
      if (widget.quizData.kr == maxBook) {
        print(maxBook);
        bookSuggestion += '\nThe Kite Runner';
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Text(bookSuggestion),
      ),
    );
  }
}
