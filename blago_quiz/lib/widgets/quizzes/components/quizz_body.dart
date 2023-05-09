import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/widgets/quizzes/components/progress_bar.dart';
import 'package:blago_quiz/widgets/quizzes/components/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionBody extends StatelessWidget {
  const QuestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            BackgroundImg.bg,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ProgressBar(),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: AppColors.pastelYellow),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: AppColors.pastelYellow),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.8,
                color: AppColors.sapphireColor,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateTheQuestionNum,
                  itemCount: questionController.questions.length,
                  itemBuilder: ((context, index) => QuestionCard(
                        question: questionController.questions[index],
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
