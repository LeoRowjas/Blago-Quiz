import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/quizzes/components/quizz_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackToPastQuizzWidget extends StatelessWidget {
  const BackToPastQuizzWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
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
      body: const QuestionBody(),
    );
  }
}
