import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/views/home/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quoz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Dosis",
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
