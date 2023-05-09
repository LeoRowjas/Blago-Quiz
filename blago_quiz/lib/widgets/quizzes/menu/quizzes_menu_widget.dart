import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:blago_quiz/widgets/quizzes/menu/components/quizz_item.dart';

import 'components/quizz_bottom_sheet.dart';

class QuizzesScreenWidget extends StatelessWidget {
  QuizzesScreenWidget({super.key});

  final List<QuizzItem> quizzes = <QuizzItem>[
    QuizzItem(
      title: "Вперед в прошлое",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.quizzColors[0],
      description:
          "Машина времени готова! Мы отправляемся в прошлое!\nЗдесь ты найдешь вопросы о древней и современной истории.",
    ),
    QuizzItem(
        title: "Красота и здоровье",
        questionTime: 15,
        questionCount: 10,
        color: AppColors.quizzColors[1],
        description:
            "Когда был изобретён пинцет? Какую прическу обожали модницы 19 века? Насколько хорошо ты разбираешься в медицине, косметике и уходе за собой?\nВ этой рубрике ты найдешь интересные вопросы, которые касаются области медицинских фактов, различных болезнях, а так же, о красоте и другое"),
    QuizzItem(
      title: "Музыкальная пауза",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.quizzColors[2],
      description:
          "Как хорошо ты разбираешься в музыке? Здесь тебя ждут вопросы о классической и современной музыке.\nВ этой рубрике ты найдешь вопросы, в которых тебе понадобятся знания различных инструментов , композиторов  и многое другое",
    ),
    QuizzItem(
      title: "Потехе время",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.quizzColors[3],
      description:
          "Мультфильмы, комиксы, видео-игры, мировое кино – всё это ждет тебя в этой категории вопросов.\nВ этой рубрике ты найдешь вопросы, которые связаны с различными мультиками, сериалами и даже комиксами",
    ),
    QuizzItem(
      title: "Кулинарная книга",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.quizzColors[4],
      description:
          "Сколько видов хачапури ты знаешь, где придумали драники и что такое песто? В этой рубрике все вкусно и интересно!\nВ этой рубрике ты найдешь вопросы о разных блюдах народов мира, фестивалях еды и много других интересных вопросов",
    ),
    QuizzItem(
      title: "Картина мира",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.quizzColors[5],
      description:
          "Мир вокруг нас полон тайн и загадок, пришло время углубиться в науку!\nВ этой рубрике ты найдешь вопросы о разных науках: географии, физики и даже астрономии",
    ),
    QuizzItem(
      title: "Правда/Ложь",
      questionTime: 15,
      questionCount: 10,
      color: AppColors.sapphireColor,
      description:
          "В этой рубрики лишь 2 ответа, а значит и вероятность победить больше!",
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
