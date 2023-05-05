import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/widgets/authScreen/auth_screen_widget.dart';
import 'package:blago_quiz/widgets/mainScreen/main_screen_widget.dart';
import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:blago_quiz/widgets/quizzes/menu/quizzes_menu_widget.dart';
import 'package:blago_quiz/widgets/quizzes/quizzes_themes/back_to_past_quizz_widget.dart';
import 'package:blago_quiz/widgets/store/store_screen_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blago Quiz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline4: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 117, 117, 117),
        ),
      ),
      routes: <String, WidgetBuilder>{
        "/auth": (context) => const AuthScreenWidget(),
        "/main": (context) => const MainScreenWidget(),
        "/quizzes": (context) => QuizzesScreenWidget(),
        "/profile": (context) => ProfileScreenWidget(),
        "/store": (context) => const StoreScreenWidget(),
        "/mainQuizz": (context) => BackToPastQuizzWidget(),
      },
      initialRoute: "/mainQuizz",
      onUnknownRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "In develop",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/auth");
                      },
                      child: const Text("Back"),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
