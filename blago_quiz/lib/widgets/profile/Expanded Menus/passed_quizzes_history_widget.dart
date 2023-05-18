import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:flutter/material.dart';

import '../Models/quiz_model.dart';

class PassedQuizzesHistoryWidget extends StatefulWidget {
  const PassedQuizzesHistoryWidget({super.key});

  @override
  State<PassedQuizzesHistoryWidget> createState() =>
      PassedQuizzesHistoryWidgetState();
}

class PassedQuizzesHistoryWidgetState
    extends State<PassedQuizzesHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _QuizzTable(quizData: User.passedQuizzes.value),
    );
  }
}

class _QuizzTable extends StatelessWidget {
  const _QuizzTable({required this.quizData});

  final List<QuizzModel> quizData;
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

class _QuizzTableItems extends StatelessWidget {
  const _QuizzTableItems({required this.quizData});
  final List<QuizzModel> quizData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          quizData.length,
          (index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(140, 0, 0, 0)),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.sapphireColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
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
            );
          },
        ),
      ],
    );
  }
}
// ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: quizData.length,
//       shrinkWrap: true,
//       itemBuilder: ((context, index) {
//         return Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color.fromARGB(140, 0, 0, 0)),
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.sapphireColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 7,
//                       child: Text(
//                         quizData[index].theme,
//                         style: AppTextStyles.whiteMediumText,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 4,
//                       child: Text(
//                         quizData[index].score.toString(),
//                         style: AppTextStyles.whiteMediumText,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 5,
//                       child: Text(
//                         quizData[index].passTime,
//                         style: AppTextStyles.whiteMediumText,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 2),
//           ],
//         );
//       }),
//     );