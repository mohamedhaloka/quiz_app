import 'dart:ui';

import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff131732);
const Color kCurrentAnswer = Colors.white;
const Color kRightAnswer = Colors.green;
const Color kFalseAnswer = Colors.red;

customHeight(context, heiNum) {
  return MediaQuery.of(context).size.height * heiNum;
}

customWidth(context, widNum) {
  return MediaQuery.of(context).size.height * widNum;
}
