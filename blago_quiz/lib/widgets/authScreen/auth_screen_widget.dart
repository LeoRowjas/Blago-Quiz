import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/mainScreen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.pastelYellow,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 30),
            child: _TopContent(),
          ),
          _LoginContentWidget(),
        ],
      ),
    );
  }
}

class _LoginContentWidget extends StatelessWidget {
  final _headerTextStyle = const TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: AppColors.sapphireColor,
    letterSpacing: 2,
  );

  const _LoginContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Вход", style: _headerTextStyle),
            const SizedBox(height: 50),
            const _InfoFormsWidget(),
            const SizedBox(height: 12),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.sapphireColor),
              onPressed: () {},
              child: const Text("Сбросить пароль"),
            ),
            const Expanded(
              child: RegisterButton(),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
              backgroundColor: AppColors.accentBlue),
          onPressed: () {},
          child: const Text(
            "Зарегестрироваться",
            style: AppTextStyles.authScreenMainText,
          ),
        )
      ],
    );
  }
}

class _InfoFormsWidget extends StatefulWidget {
  const _InfoFormsWidget();

  @override
  State<_InfoFormsWidget> createState() => _InfoFormsWidgetState();
}

class _InfoFormsWidgetState extends State<_InfoFormsWidget> {
  final _loginFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  String errorText = "";

  void auth() {
    if (_loginFieldController.text == "adm" &&
        _passwordFieldController.text == "123") {
      errorText = "";

      Get.to(const MainScreenWidget());
    } else if (_loginFieldController.text.isEmpty &&
        _passwordFieldController.text.isNotEmpty) {
      errorText = "Введите логин";
      setState(() {});
    } else if (_passwordFieldController.text.isEmpty &&
        _loginFieldController.text.isNotEmpty) {
      errorText = "Введите пароль";
      setState(() {});
    } else if (_passwordFieldController.text.isEmpty &&
        _loginFieldController.text.isEmpty) {
      errorText = "Введите логин и пароль";
      setState(() {});
    } else {
      errorText = "Неправильный логин или пароль";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _loginFieldController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Email или логин",
            prefixIcon: Icon(Icons.mail_outline),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          controller: _passwordFieldController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock_outline),
            hintText: "Пароль",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          ),
        ),
        const SizedBox(height: 12),
        if (errorText != "") ...[
          Center(
            child: Text(
              errorText,
              style: const TextStyle(color: AppColors.errorRed, fontSize: 16),
            ),
          ),
          const SizedBox(height: 12)
        ],
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.sapphireColor,
            minimumSize: const Size.fromHeight(45),
          ),
          onPressed: auth,
          child: const Text(
            "Войти",
            style: AppTextStyles.authScreenMainText,
          ),
        ),
      ],
    );
  }
}

class _TopContent extends StatelessWidget {
  const _TopContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Blago quiz",
          style: Theme.of(context).textTheme.headline3?.copyWith(
              color: AppColors.accentBlue, fontWeight: FontWeight.w600),
        ),
        const Icon(Icons.diamond_outlined,
            size: 60, color: AppColors.sapphireColor)
      ],
    );
  }
}
