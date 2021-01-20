import 'package:flutter/material.dart';
import 'package:test_app/QuizScreens/Question1.dart';

class QuizResult extends StatefulWidget {

  final int aad;
  final int pfo;
  final int tgdt;
  final int tug;

  const QuizResult({Key key, this.aad, this.pfo, this.tgdt, this.tug}) : super(key: key);

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {

    Question1 question1 = Question1();
    String bookSuggestion = '';
    if(widget.aad == 1){
      setState(() {
        bookSuggestion = 'Angels and Demons';
      });
    }
    else if(widget.pfo == 1){
      setState(() {
        bookSuggestion = 'Paris for One';
      });
    }
    else if(widget.tgdt == 1){
      setState(() {
        bookSuggestion = 'The girl with a dragon tattoo';
      });
    }
    else if(widget.tug == 1){
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
