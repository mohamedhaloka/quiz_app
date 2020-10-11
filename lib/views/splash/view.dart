import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/views/home/view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          "Quot".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
        ),
      ),
    );
  }
}
