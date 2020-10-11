import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_details.dart';

class QuizQuestion extends StatelessWidget {
  QuizQuestion({@required this.questionNumber});
  int questionNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          Quiz().quizQuestions[questionNumber],
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      flex: 2,
    );
  }
}
