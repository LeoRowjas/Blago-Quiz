// ignore_for_file: unnecessary_this

import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';
import 'package:blago_quiz/widgets/quizzes/question.dart';
import 'package:blago_quiz/widgets/score/score_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  late List<Question> _questions;
  List<Question> get questions => this._questions;

  static late QuizzItem? quizzDetails;
  QuestionController();
  QuestionController.set({QuizzItem? quizzItem}) {
    quizzDetails = quizzItem;
    _questions = quizzItem!.questions
        .map(
          (question) => Question(
            question: question.question,
            answers: question.answers,
            rightAnswerIndex: question.rightAnswerIndex,
          ),
        )
        .toList();
  }

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer = 0;
  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAnswer = 0;
  int get numOfcorrectAnswer => this._numOfCorrectAnswer;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.rightAnswerIndex;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) _numOfCorrectAnswer++;

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreenWidget(
        questions: _questions,
      ));
    }
  }

  void updateTheQuestionNum(int index) {
    _questionNumber.value = index + 1;
  }
}
