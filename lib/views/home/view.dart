import 'dart:async';

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
              height: 6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 25,
                  height: 5,
                  margin: EdgeInsets.all(2),
                  color: Quiz().quizAnswers[index] == answers[index]
                      ? Colors.green
                      : Colors.red ?? Colors.white,
                ),
                itemCount: answers.length,
              ),
            ),
            Text(
              Quiz().quizQuestions[questionNumber],
              style: TextStyle(fontSize: 30),
            ),
            Column(
              children: Quiz()
                  .answers[questionNumber]
                  .map((e) => Container(
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
                          onPressed: () => onPress(e),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  onPress(e) {
    setState(() {
      if (questionNumber < Quiz().quizQuestions.length - 1) {
        if (Quiz().quizAnswers[questionNumber] == e) {
          print("true");
          answers.add(e);
          correctAnswers.add("1");
        } else {
          print("false!");
          answers.add(e);
        }
        setState(() {
          questionNumber++;
        });
      } else {
        if (answers.length == Quiz().quizQuestions.length) {
          Dialog();
        } else {
          answers.add(e);
          correctAnswers.add(e);

          print(answers.length);
          print(correctAnswers.length);
          print(Quiz().quizQuestions.length);
          Dialog();
        }
      }
    });
  }

  Dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                  "You HAve ${correctAnswers.length} of ${Quiz().quizQuestions.length}"),
            ));
  }
}
