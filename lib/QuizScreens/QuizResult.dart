import 'package:flutter/material.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/model/QuizDataModel.dart';
import 'dart:math';
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
    List<int> Books = [widget.quizData.aad, widget.quizData.pfo, widget.quizData.tug,
    widget.quizData.tgdt, widget.quizData.hppa, widget.quizData.eu, widget.quizData.csms,
    widget.quizData.pw, widget.quizData.fsg, widget.quizData.ts, widget.quizData.kr];
    int maxBook = quiver.max(Books);

    if(widget.quizData.aad == maxBook){
      print(maxBook);
      bookSuggestion = 'Angels and Demons';
    }
    else if(widget.quizData.tug == maxBook){
      print(maxBook);
      bookSuggestion = 'The Undomestic Goddess';
    }
    else if(widget.quizData.tgdt == maxBook){
      print(maxBook);
      bookSuggestion = 'The Girl with the Dragon Tattoo';
    }
    else if(widget.quizData.hppa == maxBook){
      bookSuggestion = 'Harry Potter and the prisoner of Azkaban';
    }
    else if(widget.quizData.pfo == maxBook){
      print(maxBook);
      bookSuggestion = 'Paris for One';
    }
    else if(widget.quizData.ts == maxBook){
      print(maxBook);
      bookSuggestion = 'The Selection';
    }
    else if(widget.quizData.fsg == maxBook){
      print(maxBook);
      bookSuggestion = 'Fifty Shades of grey';
    }
    else if(widget.quizData.pw == maxBook){
      print(maxBook);
      bookSuggestion = 'Parallel Worlds';
    }
    else if(widget.quizData.csms == maxBook){
      print(maxBook);
      bookSuggestion = 'Cosmos';
    }
    else if(widget.quizData.eu == maxBook){
      print(maxBook);
      bookSuggestion = 'Elegant Universe';
    }
    else if(widget.quizData.kr == maxBook){
      print(maxBook);
      bookSuggestion = 'The Kite Runner';
    }


    // if(widget.quizData.aad == 1){
    //   setState(() {
    //     bookSuggestion = 'Angels and Demons';
    //   });
    // }
    // else if(widget.quizData.pfo == 1){
    //   setState(() {
    //     bookSuggestion = 'Paris for One';
    //   });
    // }
    // else if(widget.quizData.tgdt == 1){
    //   setState(() {
    //     bookSuggestion = 'The girl with a dragon tattoo';
    //   });
    // }
    // else if(widget.quizData.tug == 1){
    //   setState(() {
    //     bookSuggestion = 'The Undomestic Goddess';
    //   });
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          bookSuggestion
        ),
      ),
    );
  }
}
