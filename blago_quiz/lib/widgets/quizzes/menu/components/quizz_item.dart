import 'package:flutter/material.dart';

class QuizzItem {
  final String title;
  final int questionTime;
  final int questionCount;
  final Color color;

  final String description;

  QuizzItem({
    required this.title,
    required this.questionTime,
    required this.questionCount,
    required this.color,
    required this.description,
  });
}
