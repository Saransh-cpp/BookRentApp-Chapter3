import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: Center(
        child: Text(
          'Quiz here'
        ),
      ),
    );
  }
}
