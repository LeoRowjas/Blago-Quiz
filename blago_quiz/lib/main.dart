import 'package:blago_quiz/widgets/auth/auth_screen_widget.dart';
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
      theme: ThemeData(),
      routes: <String, WidgetBuilder>{
        "/auth": (context) => const AuthScreenWidget(),
      },
      initialRoute: "/auth",
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
