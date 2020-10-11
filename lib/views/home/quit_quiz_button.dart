import 'dart:io';

import 'package:flutter/material.dart';

class QuitQuizButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 118,
            height: 70,
            alignment: Alignment.bottomCenter,
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
          ),
        ));
  }
}
