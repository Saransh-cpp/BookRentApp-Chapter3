import 'package:flutter/material.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/model/QuizDataModel.dart';

class QuizResult extends StatefulWidget {

  final QuizData quizData;

  const QuizResult({Key key, this.quizData}) : super(key: key);

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {

    print(widget.quizData.aad);
    String bookSuggestion = '';
    if(widget.quizData.aad == 1){
      setState(() {
        bookSuggestion = 'Angels and Demons';
      });
    }
    else if(widget.quizData.pfo == 1){
      setState(() {
        bookSuggestion = 'Paris for One';
      });
    }
    else if(widget.quizData.tgdt == 1){
      setState(() {
        bookSuggestion = 'The girl with a dragon tattoo';
      });
    }
    else if(widget.quizData.tug == 1){
      setState(() {
        bookSuggestion = 'The Undomestic Goddess';
      });
    }
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
