// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:blago_quiz/controllers/question_controller.dart';
import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/widgets/mainScreen/main_screen_widget.dart';
import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';
import 'package:blago_quiz/widgets/quizzes/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profile/Models/quiz_model.dart';

class ScoreScreenWidget extends StatefulWidget {
  const ScoreScreenWidget({super.key, required this.questions});
  final List<Question> questions;

  @override
  State<ScoreScreenWidget> createState() => _ScoreScreenWidgetState();
}

class _ScoreScreenWidgetState extends State<ScoreScreenWidget> {
  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    QuizzItem? quizDetails = QuestionController.quizzDetails;

    void onQuit() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("quiz1RES", [
        quizDetails!.title,
        (qnController.numOfcorrectAnswer * 100).toString(),
        "${DateFormat("Hm").format(DateTime.now())} ${DateFormat("yMMMd").format(DateTime.now())}",
      ]);
      User.passedQuizzes.value.insert(
        0,
        QuizzModel(
          quizDetails.title,
          qnController.numOfcorrectAnswer * 100,
          DateTime.now(),
        ),
      );
      User.balance.value += qnController.numOfcorrectAnswer * 100;
      User.passedQuizzes.notifyListeners();
      Get.offAll(() => const MainScreenWidget());
    }

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
                onPressed: onQuit,
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
