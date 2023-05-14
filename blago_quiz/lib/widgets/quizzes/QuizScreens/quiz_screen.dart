import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/quizzes/components/quizz_body.dart';
import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    super.key,
    required this.quizzItem,
  });
  final QuizzItem quizzItem;

  @override
  Widget build(BuildContext context) {
    QuestionController controller =
        Get.put(QuestionController.set(quizzItem: quizzItem));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: controller.nextQuestion,
            child:
                const Text("Пропустить", style: AppTextStyles.whiteHeader3Text),
          ),
        ],
      ),
      body: QuestionBody(
        questions: quizzItem.questions,
      ),
    );
  }
}
