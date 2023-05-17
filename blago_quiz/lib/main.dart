import 'package:blago_quiz/widgets/authScreen/auth_screen_widget.dart';
import 'package:blago_quiz/widgets/mainScreen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? isUserLogin = pref.getBool("isUserLogin");
  runApp(MyApp(isUserLogin: isUserLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isUserLogin});
  final bool? isUserLogin;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: isUserLogin != null
          ? const MainScreenWidget()
          : const AuthScreenWidget(),
    );
  }
}
