import 'package:blago_quiz/widgets/quizzes/QuizScreens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:get/get.dart';

class QuizzBottomSheetWidget extends StatelessWidget {
  const QuizzBottomSheetWidget({super.key, required this.quizz});
  final QuizzItem quizz;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        _TopQuizzBottomSheet(
          quizz: quizz,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Количество вопросов - ${quizz.questionCount}",
                  style: AppTextStyles.blackLargeText),
              Text("Время на вопрос - ${quizz.questionTime} сек.",
                  style: AppTextStyles.blackLargeText),
              const SizedBox(height: 20),
              Text(
                quizz.description,
                style: AppTextStyles.blackLargeText,
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: AppColors.accentBlue),
          onPressed: () => Get.off(
            QuizScreen(
              quizzItem: quizz,
            ),
          ),
          child: const Center(
              child: Text(
            "Начать!",
            style: AppTextStyles.whiteHeader3Text,
          )),
        )
      ],
    );
  }
}

class _TopQuizzBottomSheet extends StatelessWidget {
  const _TopQuizzBottomSheet({required this.quizz});

  final QuizzItem quizz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: quizz.color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: Center(
          child: Text(quizz.title, style: AppTextStyles.whiteHeader2Text)),
    );
  }
}
