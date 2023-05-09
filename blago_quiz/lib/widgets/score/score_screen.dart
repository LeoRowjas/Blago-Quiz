import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreScreenWidget extends StatelessWidget {
  const ScoreScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(BackgroundImg.bg, fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Очки",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                "${qnController.numOfcorrectAnswer * 100}/${qnController.questions.length * 100}",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorRed),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/main");
                },
                child: Text(
                  "На главную",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const Spacer(flex: 3)
            ],
          )
        ],
      ),
    );
  }
}
