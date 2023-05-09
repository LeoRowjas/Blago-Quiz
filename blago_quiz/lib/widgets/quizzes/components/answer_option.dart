import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAnswer) {
                return Colors.green;
              } else if (index == qnController.selectedAnswer &&
                  qnController.selectedAnswer != qnController.correctAnswer) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 26),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${index + 1}. $text",
                      style:
                          TextStyle(color: getTheRightColor(), fontSize: 16)),
                  Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: getTheRightColor() == Colors.grey
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor()),
                      ),
                      child: getTheRightColor() == Colors.grey
                          ? null
                          : Icon(
                              getTheRightIcon(),
                              size: 21,
                              color: Colors.white,
                            ))
                ],
              ),
            ),
          );
        });
  }
}
