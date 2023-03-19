import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';

class QuizzItem {
  final String title;
  final int questionTime;
  final int questionCount;

  final List<Color> gradientColors;

  QuizzItem({
    required this.title,
    required this.questionTime,
    required this.questionCount,
    required this.gradientColors,
  });
}

class QuizzesScreenWidget extends StatelessWidget {
  QuizzesScreenWidget({super.key});

  final List<QuizzItem> quizzes = <QuizzItem>[
    QuizzItem(
        title: "Вперед в прошлое",
        questionTime: 15,
        questionCount: 30,
        gradientColors: AppColors.gradients[0]),
    QuizzItem(
      title: "Красота и здоровье",
      questionTime: 30,
      questionCount: 15,
      gradientColors: AppColors.gradients[1],
    ),
    QuizzItem(
      title: "Потехе время",
      questionTime: 40,
      questionCount: 10,
      gradientColors: AppColors.gradients[2],
    ),
    QuizzItem(
      title: "Кулинарная книга",
      questionTime: 10,
      questionCount: 40,
      gradientColors: AppColors.gradients[3],
    ),
    QuizzItem(
      title: "Картина мира",
      questionTime: 20,
      questionCount: 30,
      gradientColors: AppColors.gradients[4],
    ),
    QuizzItem(
      title: "Правда/Ложь",
      questionTime: 20,
      questionCount: 30,
      gradientColors: <Color>[AppColors.accentBlue, AppColors.accentBlue],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuizzItemsWidget(quizzes: quizzes);
  }
}

class QuizzItemsWidget extends StatelessWidget {
  const QuizzItemsWidget({
    Key? key,
    required this.quizzes,
  }) : super(key: key);

  final List<QuizzItem> quizzes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: quizzes.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(157, 0, 0, 0),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                      gradient: LinearGradient(
                          stops: const [0.3, 0.7],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            quizzes[index].gradientColors[0],
                            quizzes[index].gradientColors[1],
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 55, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quizzes[index].title,
                            style: AppTextStyles.whiteHeader2Text,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${quizzes[index].questionTime} сек. на вопрос",
                                  style: AppTextStyles.additionalGreyText),
                              Text("${quizzes[index].questionCount} вопросов",
                                  style: AppTextStyles.additionalGreyText)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}
