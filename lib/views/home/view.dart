import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/quiz_details.dart';
import 'package:quiz_app/views/home/quit_quiz_button.dart';
import 'package:quiz_app/views/home/quiz_header.dart';
import 'package:quiz_app/views/home/quiz_question.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List correctAnswers = [];
  List answers = [];
  List lastScore = [];
  int questionNumber = 0;
  List<IconData> answerIcon = List.generate(5, (index) => null);
  List<Color> containerColor = List.generate(5, (index) => Colors.grey[200]);
  List<Color> textColor = List.generate(5, (index) => Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: customWidth(context, 1),
                height: 80,
                child: QuizHeader(
                    questionNumber: questionNumber, answers: answers)),
            QuizQuestion(
              questionNumber: questionNumber,
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Quiz().answers[questionNumber].length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: containerColor[index])),
                      child: RaisedButton(
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        color: Colors.transparent,
                        onPressed: () => onPress(index),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Quiz().answers[questionNumber].elementAt(index),
                              style: TextStyle(fontSize: 18,color: textColor[index]),
                            ),
                            Icon(
                              answerIcon[index],
                              color: containerColor[index],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              flex: 5,
            ),
            QuitQuizButton()
          ],
        ),
      ),
    );
  }

  onPress(index) {
    setState(() {
      if (questionNumber < Quiz().quizQuestions.length - 1) {
        if (Quiz().quizAnswers[questionNumber] ==
            Quiz().answers[questionNumber].elementAt(index)) {
          print("true");
          answerIcon[index] = Icons.check;
          containerColor[index] = Colors.green;
          textColor[index] = Colors.green;

          answers.add(Quiz().answers[questionNumber].elementAt(index));
          correctAnswers.add("1");
          lastScore.add("1");
        } else {
          print("false!");
          answerIcon[index] = Icons.close;
          containerColor[index] = Colors.red;
          textColor[index] = Colors.red;

          answers.add(Quiz().answers[questionNumber].elementAt(index));
        }
        Timer(Duration(seconds: 1), () {
          setState(() {
            questionNumber++;
          });
        });
      } else {
        if (answers.length == Quiz().quizQuestions.length) {
          Dialog();
        } else if (Quiz().quizAnswers[questionNumber] ==
            Quiz().answers[questionNumber].elementAt(index)) {
          answers.add(Quiz().answers[questionNumber].elementAt(index));
          correctAnswers.add("1");
          Dialog();
        } else {
          answers.add(Quiz().answers[questionNumber].elementAt(index));
          print(answers.length);
          print(correctAnswers.length);
          print(Quiz().quizQuestions.length);
          Dialog();
        }
      }
      Timer(Duration(seconds: 1), () {
        answerIcon[index] = null;
        containerColor[index] = Colors.grey[300];
        textColor[index] = Colors.white;
      });
    });
  }

  Dialog() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
            "You Have ${correctAnswers.length} of ${Quiz().quizQuestions.length}"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"))
        ],
      ),
    );
  }
}
