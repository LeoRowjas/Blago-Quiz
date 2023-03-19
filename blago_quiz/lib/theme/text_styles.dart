import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const authScreenMainText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const blackHeader = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const additionalGreyText = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
  static const whiteMediumText = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static const blackMediumText = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(200, 0, 0, 0),
    fontWeight: FontWeight.w500,
  );
  static const whiteHeader3Text = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static const whiteHeader2Text = TextStyle(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static const blackLargeText = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
