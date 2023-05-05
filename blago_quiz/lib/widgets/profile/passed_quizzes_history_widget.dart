import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PassedQuizzesHistoryWidget extends StatefulWidget {
  PassedQuizzesHistoryWidget({super.key});
  static final model = [
    _QuizzModel("Наука", 450, DateTime(2022, 4, 5, 17, 30)),
    _QuizzModel("Искусство", 450, DateTime(2022, 4, 5, 17, 30)),
    _QuizzModel("Общая", 450, DateTime(2022, 4, 5, 17, 30)),
    _QuizzModel("Кино и мультфильмы", 450, DateTime(2022, 4, 5, 17, 30)),
    _QuizzModel("theme", 450, DateTime.now())
  ];

  @override
  State<PassedQuizzesHistoryWidget> createState() =>
      PassedQuizzesHistoryWidgetState();
}

class PassedQuizzesHistoryWidgetState
    extends State<PassedQuizzesHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _QuizzTable(quizData: PassedQuizzesHistoryWidget.model),
    );
  }
}

class _QuizzModel {
  String theme;
  int score;
  DateTime dateTime;
  late String passTime;

  _QuizzModel(this.theme, this.score, this.dateTime) {
    passTime =
        "${DateFormat("Hm").format(dateTime)} ${DateFormat("yMMMd").format(dateTime)}";
  }
}

class _QuizzTable extends StatelessWidget {
  const _QuizzTable({required this.quizData});

  final List<_QuizzModel> quizData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.pastelYellow,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Expanded(
                  flex: 6,
                  child: Text("Тема", style: AppTextStyles.blackMediumText),
                ),
                Expanded(
                  flex: 5,
                  child: Text("Баллы", style: AppTextStyles.blackMediumText),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Дата", style: AppTextStyles.blackMediumText),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _QuizzTableItems(quizData: quizData)
      ],
    );
  }
}

//TODO: создать система инхеритед виджетов, чтобы не прокидывать через конструкторы каждый раз данные
class _QuizzTableItems extends StatelessWidget {
  const _QuizzTableItems({required this.quizData});
  final List<_QuizzModel> quizData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quizData.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(140, 0, 0, 0)),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.sapphireColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        quizData[index].theme,
                        style: AppTextStyles.whiteMediumText,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        quizData[index].score.toString(),
                        style: AppTextStyles.whiteMediumText,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        quizData[index].passTime,
                        style: AppTextStyles.whiteMediumText,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),
          ],
        );
      }),
    );
  }
}
