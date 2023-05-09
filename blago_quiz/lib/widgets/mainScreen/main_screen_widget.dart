import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/widgets/infoSceen/info_screen_widget.dart';
import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:blago_quiz/widgets/mainScreen/top_info_widget.dart';
import 'package:blago_quiz/widgets/quizzes/menu/quizzes_menu_widget.dart';
import 'package:blago_quiz/widgets/store/store_screen_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void _onTabChange(int index) {
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: TopInfoWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: IndexedStack(
          index: _selectedTab,
          children: [
            QuizzesScreenWidget(),
            ProfileScreenWidget(),
            const StoreScreenWidget(),
            const InfoScreenWidget()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.accentBlue,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabChange,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: "Квизы"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
          BottomNavigationBarItem(
              icon: Icon(Icons.diamond_outlined), label: "Магазин"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "Инфо"),
        ],
      ),
    );
  }
}
