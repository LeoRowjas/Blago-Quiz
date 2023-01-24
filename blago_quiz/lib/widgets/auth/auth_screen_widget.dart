import 'package:blago_quiz/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScreenWidget extends StatelessWidget {
  final _headerStyle = const TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: AppColors.sapphireColor,
    letterSpacing: 2,
  );
  final _mainTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.pastelYellow,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 90),
            child: Text(
              "Some content with app name",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Вход",
                    style: _headerStyle,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email или логин",
                      prefixIcon: Icon(Icons.mail_outline),
                      focusColor: Colors.black,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Пароль",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.sapphireColor,
                      minimumSize: const Size.fromHeight(45),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Войти",
                      style: _mainTextStyle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.sapphireColor),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed("/resetPassword");
                    },
                    child: const Text("Сбросить пароль"),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(45),
                                backgroundColor: AppColors.accentBlue),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("/register");
                            },
                            child: const Text("Зарегестрироваться"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
