import 'package:blago_quiz/samples/quizzes_const.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';

import 'components/quizz_bottom_sheet.dart';

class QuizzesScreenWidget extends StatelessWidget {
  const QuizzesScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizzItemsWidget(quizzes: kQuizzes);
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
                          return QuizzBottomSheetWidget(quizz: quizzes[index]);
                        },
                      );
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
