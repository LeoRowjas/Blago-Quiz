import 'package:blago_quiz/samples/questions/beauty_health.dart';
import 'package:blago_quiz/samples/questions/music_pause.dart';
import 'package:blago_quiz/samples/questions/romanov_questions.dart';
import 'package:blago_quiz/samples/questions/time_for_jokes.dart';
import 'package:blago_quiz/theme/app_colors.dart';

import '../widgets/quizzes/menu/components/quizz_item.dart';

List<QuizzItem> kQuizzes = <QuizzItem>[
  QuizzItem(
    title: "Вперед в прошлое",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[0],
    description:
        "Машина времени готова! Мы отправляемся в прошлое!\nЗдесь ты найдешь вопросы о древней и современной истории.",
    questions: RomanovQuestions.questions,
  ),
  QuizzItem(
    title: "Красота и здоровье",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[1],
    description:
        "Когда был изобретён пинцет? Какую прическу обожали модницы 19 века? Насколько хорошо ты разбираешься в медицине, косметике и уходе за собой?\nВ этой рубрике ты найдешь интересные вопросы, которые касаются области медицинских фактов, различных болезнях, а так же, о красоте и другое",
    questions: BeautyHealthQsts.questions,
  ),
  QuizzItem(
    title: "Музыкальная пауза",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[2],
    description:
        "Как хорошо ты разбираешься в музыке? Здесь тебя ждут вопросы о классической и современной музыке.\nВ этой рубрике ты найдешь вопросы, в которых тебе понадобятся знания различных инструментов , композиторов  и многое другое",
    questions: MusicQuests.questions,
  ),
  QuizzItem(
    title: "Потехе время",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[3],
    description:
        "Мультфильмы, комиксы, видео-игры, мировое кино – всё это ждет тебя в этой категории вопросов.\nВ этой рубрике ты найдешь вопросы, которые связаны с различными мультиками, сериалами и даже комиксами",
    questions: JokesTimeQuestions.questions,
  ),
  QuizzItem(
    title: "Кулинарная книга",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[4],
    description:
        "Сколько видов хачапури ты знаешь, где придумали драники и что такое песто? В этой рубрике все вкусно и интересно!\nВ этой рубрике ты найдешь вопросы о разных блюдах народов мира, фестивалях еды и много других интересных вопросов",
    questions: [],
  ),
  QuizzItem(
    title: "Картина мира",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.quizzColors[5],
    description:
        "Мир вокруг нас полон тайн и загадок, пришло время углубиться в науку!\nВ этой рубрике ты найдешь вопросы о разных науках: географии, физики и даже астрономии",
    questions: [],
  ),
  QuizzItem(
    title: "Правда/Ложь",
    questionTime: 15,
    questionCount: 10,
    color: AppColors.sapphireColor,
    description:
        "В этой рубрики лишь 2 ответа, а значит и вероятность победить больше!",
    questions: [],
  ),
];
