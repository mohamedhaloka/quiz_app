import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/quiz_details.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List correctAnswers = [];
  List answers = [];
  int questionNumber = 0;
  List<IconData> answerIcon = List.generate(5, (index) => null);
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
                        color: Colors.white38),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 25,
                  height: 5,
                  margin: EdgeInsets.all(2),
                  color: Quiz().quizAnswers[index] == answers[index]
                      ? Colors.green
                      : Colors.red,
                ),
                itemCount: answers.length,
              ),
            ),
            Expanded(
              child: Text(
                Quiz().quizQuestions[questionNumber],
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              flex: 2,
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
                          border: Border.all(color: Colors.grey[200])),
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
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(answerIcon[index]),
                          ],
                        ),
                      ),
                    );
                  }),
              flex: 5,
            ),
            Expanded(
                child: Container(
              width: 118,
              height: 70,
              child: RaisedButton(
                onPressed: () => exit(0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/shutdown.png",
                      width: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Shutdown")
                  ],
                ),
                color: Colors.transparent,
                elevation: 0.0,
                highlightElevation: 0.0,
              ),
            ))
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

          answers.add(Quiz().answers[questionNumber].elementAt(index));
          correctAnswers.add("1");
        } else {
          print("false!");
          answerIcon[index] = Icons.close;

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
        } else {
          answers.add(Quiz().answers[questionNumber].elementAt(index));
          correctAnswers.add("1");
          print(answers.length);
          print(correctAnswers.length);
          print(Quiz().quizQuestions.length);
          Dialog();
        }
      }
      Timer(Duration(seconds: 1), () {
        answerIcon[index] = null;
      });
    });
  }

  Dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: kPrimaryColor,
              content: Text(
                  "You HAve ${correctAnswers.length} of ${Quiz().quizQuestions.length}"),
            ));
  }
}
