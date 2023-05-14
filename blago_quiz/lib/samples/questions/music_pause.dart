import 'package:blago_quiz/widgets/quizzes/question.dart';

abstract class MusicQuests {
  static final List<Question> questions = [
    Question(
      question: "К каким инструментам относится «геликон»?",
      answers: [
        "Деревянные духовые",
        "Медные духовые",
        "Лабиальные",
        "Ударные"
      ],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Какая группа музыкальных инструментов возникла первой?	",
      answers: "Ударные Духовые Струнные Клавишные".split(" "),
      rightAnswerIndex: 0,
    ),
    Question(
      question:
          "Сколько всего опер за свою творческую жизнь написал Н. А. Римский-Корсаков?",
      answers: "4 3 15 5".split(" "),
      rightAnswerIndex: 2,
    ),
    Question(
      question:
          "В каком из балетов П. И. Чайковского звучит произведение «Вальс цветов»?",
      answers: ["Спящая красавица", "Щелкунчик", "Лебединое озеро", "Аделина"],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Кто из этих композиторов не написал ни одной оперы?",
      answers: [
        "С. В. Рахманинов",
        "Франц Шуберт",
        "Иоганнес Брамс",
        "И. Ф. Стравинский"
      ],
      rightAnswerIndex: 2,
    ),
    Question(
      question: "Как называется первая симфония Петра Ильича Чайковского?",
      answers: ["Патетическая", "Лето", "Малороссийская", "Зимние грёзы"],
      rightAnswerIndex: 3,
    ),
    Question(
      question: "Самый многострунный инструмент - это?",
      answers: "Гитара Цитра Арфа Лютня".split(" "),
      rightAnswerIndex: 2,
    ),
    Question(
      question: "Сколько струн у арфы?",
      answers: "54 115 201 46".split(" "),
      rightAnswerIndex: 3,
    ),
    Question(
      question:
          " Какой из этих инструментов представляет собой духовой клавишный?",
      answers: "Клавикорд Пианино Терменвокс Фисгармония".split(" "),
      rightAnswerIndex: 3,
    ),
    Question(
      question:
          "Какие инструменты представляют самое многочисленное своё семейство?",
      answers: "Клавишные Электромузыкальные Ударные Струнные".split(" "),
      rightAnswerIndex: 2,
    ),
  ];
}
