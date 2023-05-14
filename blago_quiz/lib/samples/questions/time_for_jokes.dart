import 'package:blago_quiz/widgets/quizzes/question.dart';

abstract class JokesTimeQuestions {
  static final List<Question> questions = [
    Question(
      question: "Как звали главного героя Dishonored?",
      answers: "Гаррет Корво Букер Гаррус".split(" "),
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Где снимали трилогию «Властелин колец»?",
      answers: [
        "В Ирландии",
        "В Исландии",
        "В Новой Зеландии",
        "В Австралии",
      ],
      rightAnswerIndex: 2,
    ),
    Question(
      question:
          "Какое животное НЕ встретил на своем пути главный герой мультфильма «Ежик в тумане»?",
      answers: [
        "Летучую мышь",
        "Слона",
        "Змею",
        "Собаку",
      ],
      rightAnswerIndex: 2,
    ),
    Question(
      question: "Какой способностью обладала Фиалка в «Суперсемейке»?",
      answers: "Суперсила Невидимость Скорость Телепатия".split(" "),
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Главная героиня мульт-сериала \"Винкс\"",
      answers: "Стелла Флора Блум Текна".split(" "),
      rightAnswerIndex: 2,
    ),
    Question(
      question: "Как звали львицу, подругу детства Симбы?",
      answers: "Шензи Зазу Тилу Нала".split(" "),
      rightAnswerIndex: 3,
    ),
    Question(
      question: "Как зовут Хамелеона в «Рапунцель: Запутанная история»?",
      answers: "Паскаль Морти Норберт Леонард".split(" "),
      rightAnswerIndex: 0,
    ),
    Question(
      question: "Назовите учителя Брюса Ли, именем которого назвали фильм.",
      answers: ["Ип Ман", "Пьяный мастер", "Лю Канг", "Ли Чанг"],
      rightAnswerIndex: 0,
    ),
    Question(
      question: "Какой предмет вёл в школе учитель в мультфильме «Душа»?",
      answers: "Музыку Математику Физкультуру Физику".split(" "),
      rightAnswerIndex: 0,
    ),
    Question(
      question:
          "Чем Карлсон чинит забарахливший мотор своего пропеллера в мультфильме «Малыш и Карлсон»?",
      answers: "Вареньем Плюшками Тортами Мороженым".split(" "),
      rightAnswerIndex: 0,
    ),
  ];
}
