import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_details.dart';

import '../../const.dart';

class QuizHeader extends StatelessWidget {
  QuizHeader({@required this.questionNumber, @required this.answers});
  int questionNumber;
  List answers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: Text(
            "Some Question About Me!",
            style: TextStyle(color: Colors.white38, fontSize: 22),
          ),
          alignment: Alignment.centerLeft,
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Question".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                questionNumber < 9
                    ? "0${questionNumber + 1}"
                    : "${questionNumber + 1}",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36),
              ),
              Text(
                "/${Quiz.quizs.length}",
                style: TextStyle(color: Colors.white38, fontSize: 30),
              ),
            ],
          ),
        ),
        Container(
          width: customWidth(context, 1),
          height: 6,
          child: Stack(
            children: [
              drawAnswerTracker(Quiz().quizQuestions.length, false),
              drawAnswerTracker(answers.length, true),
            ],
          ),
        ),
      ],
    );
  }

  drawAnswerTracker(list, colorAnswer) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        width: customWidth(context, 0.04),
        height: 5,
        margin: EdgeInsets.all(2),
        color: colorAnswer
            ? Quiz().quizAnswers[index] == answers[index]
                ? Colors.green
                : Colors.red
            : questionNumber == index
                ? Colors.white
                : Colors.white38,
      ),
      itemCount: list,
    );
  }
}
