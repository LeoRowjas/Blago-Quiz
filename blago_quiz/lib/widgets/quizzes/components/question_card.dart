import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/widgets/quizzes/components/answer_option.dart';
import 'package:blago_quiz/widgets/quizzes/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.put(QuestionController());

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            question.answers.length,
            (index) => AnswerOption(
              text: question.answers[index],
              index: index,
              press: () => controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
