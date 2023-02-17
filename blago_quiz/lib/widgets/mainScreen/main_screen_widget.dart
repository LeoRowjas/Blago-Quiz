import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/widgets/profileScreen/profile_screen_widget.dart';
import 'package:blago_quiz/widgets/mainScreen/top_info_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void _onTabChange(int index) {
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: TopInfoWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: IndexedStack(
          index: _selectedTab,
          children: [
            const Center(child: Text("Экран викторины находится в разработке")),

            //TODO: Профиль - история прохождения викторин(название, баллы, дата)
            //TODO: Профиль - Обменянные призы(название, статус, дата)
            //TODO: Профиль - раздвигающиеся меню
            ProfileScreenWidget(),

            const Center(
              child: Text("Экран магазина находится в разработке"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.accentBlue,
        onTap: _onTabChange,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: "Викторины"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
          BottomNavigationBarItem(
              icon: Icon(Icons.diamond_outlined), label: "Магазин")
        ],
      ),
    );
  }
}
