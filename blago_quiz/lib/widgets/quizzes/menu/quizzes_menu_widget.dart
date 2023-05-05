import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';

class QuizzItem {
  final String title;
  final int questionTime;
  final int questionCount;

  final Color color;

  QuizzItem({
    required this.title,
    required this.questionTime,
    required this.questionCount,
    required this.color,
  });
}

class QuizzesScreenWidget extends StatelessWidget {
  QuizzesScreenWidget({super.key});

  final List<QuizzItem> quizzes = <QuizzItem>[
    QuizzItem(
        title: "Вперед в прошлое",
        questionTime: 15,
        questionCount: 30,
        color: AppColors.quizzColors[0]),
    QuizzItem(
      title: "Красота и здоровье",
      questionTime: 30,
      questionCount: 15,
      color: AppColors.quizzColors[1],
    ),
    QuizzItem(
      title: "Потехе время",
      questionTime: 40,
      questionCount: 10,
      color: AppColors.quizzColors[2],
    ),
    QuizzItem(
      title: "Кулинарная книга",
      questionTime: 10,
      questionCount: 40,
      color: AppColors.quizzColors[3],
    ),
    QuizzItem(
      title: "Картина мира",
      questionTime: 20,
      questionCount: 30,
      color: AppColors.quizzColors[4],
    ),
    QuizzItem(
      title: "Правда/Ложь",
      questionTime: 20,
      questionCount: 30,
      color: AppColors.sapphireColor,
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
            const SizedBox(height: 10),
            Center(
              child: Material(
                color: quizzes[index].color,
                elevation: 7,
                borderRadius: BorderRadius.circular(20),
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return QuizzBottomSheetWidget(
                                quizz: quizzes[index]);
                          });
                    },
                    borderRadius: BorderRadius.circular(20),
                    splashColor: quizzes[index].color,
                    highlightColor: AppColors.accentBlue,
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
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
                            Text("${quizzes[index].questionCount} вопросов",
                                style: AppTextStyles.whiteMediumText),
                          ],
                        ),
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

class QuizzBottomSheetWidget extends StatelessWidget {
  const QuizzBottomSheetWidget({super.key, required this.quizz});
  final QuizzItem quizz;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TopQuizzBottomSheet(
            quizz: quizz,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Количество вопросов - ${quizz.questionCount}",
                    style: AppTextStyles.blackLargeText),
                Text("Время на вопрос - ${quizz.questionTime} сек.",
                    style: AppTextStyles.blackLargeText),
                const SizedBox(height: 20),
                const Text(
                  "Описание викторины будет здесь\nИ здесь тутутуту\nА также скорее всего здесь\nИ даже возможно здесь",
                  style: AppTextStyles.blackLargeText,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: AppColors.accentBlue),
                  onPressed: () {},
                  child: const Center(
                      child: Text(
                    "Начать!",
                    style: AppTextStyles.whiteHeader3Text,
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TopQuizzBottomSheet extends StatelessWidget {
  const _TopQuizzBottomSheet({super.key, required this.quizz});

  final QuizzItem quizz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: quizz.color,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Center(
          child: Text(quizz.title, style: AppTextStyles.whiteHeader2Text)),
    );
  }
}
