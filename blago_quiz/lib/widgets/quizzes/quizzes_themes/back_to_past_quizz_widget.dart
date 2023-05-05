import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/quizzes/components/quizz_body.dart';
import 'package:flutter/material.dart';
import 'package:blago_quiz/widgets/quizzes/question.dart';
import 'package:blago_quiz/questions/romanov_questions.dart';

class BackToPastQuizzWidget extends StatelessWidget {
  BackToPastQuizzWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {},
            child:
                const Text("Пропустить", style: AppTextStyles.whiteHeader3Text),
          ),
        ],
      ),
      body: QuestionBody(),
    );
  }
}
