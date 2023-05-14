import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'Expanded Menus/passed_quizzes_history_widget.dart';
import 'Expanded Menus/purchase_history_widget.dart';
import 'Models/purchase_operation.dart';
import 'Models/quiz_model.dart';

abstract class User with ChangeNotifier {
  static ValueNotifier<int> balance = ValueNotifier(5000);
  static String name = "Леонид";

  static ValueNotifier<List<PurchaseData>> purchases = ValueNotifier([]);
  static ValueNotifier<List<QuizzModel>> passedQuizzes = ValueNotifier([]);
}

class ProfileScreenWidget extends StatelessWidget {
  ProfileScreenWidget({
    super.key,
  });

  final List<ExpansionPanelData> data = [
    ExpansionPanelData(
      headerValue: "Пройденные викторины",
      expandedValue: const PassedQuizzesHistoryWidget(),
    ),
    ExpansionPanelData(
      headerValue: "Покупки",
      expandedValue: const PurchaseHistory(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _TopInfoProfileWidget(),
            const Divider(
              height: 40,
              thickness: 1.5,
              color: Colors.black,
            ),
            ExpansionMenus(data: data),
          ],
        )
      ],
    );
  }
}

class _TopInfoProfileWidget extends StatefulWidget {
  const _TopInfoProfileWidget();

  @override
  State<_TopInfoProfileWidget> createState() => _TopInfoProfileWidgetState();
}

class _TopInfoProfileWidgetState extends State<_TopInfoProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: CircleAvatar(
            backgroundImage: AssetImage(ProfileImg.leonid),
            radius: 70,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            User.name,
            style: AppTextStyles.blackHeader,
          ),
        ),
        const PassedQuizzCount(),
        const PurchasesCount(),
      ],
    );
  }
}

class PassedQuizzCount extends StatelessWidget {
  const PassedQuizzCount({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: User.passedQuizzes,
      builder: ((context, value, child) {
        return Text(
          "Пройдено викторин - ${value.length}",
          style: AppTextStyles.additionalGreyText,
        );
      }),
    );
  }
}

class PurchasesCount extends StatelessWidget {
  const PurchasesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: User.purchases,
      builder: ((context, value, child) {
        return Text(
          "Куплено предметов - ${value.length}",
          style: AppTextStyles.additionalGreyText,
        );
      }),
    );
  }
}

class ExpansionPanelData {
  final Widget expandedValue;
  final String headerValue;
  bool isExpanded;

  ExpansionPanelData({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
}

class ExpansionMenus extends StatefulWidget {
  const ExpansionMenus({super.key, required this.data});

  final List<ExpansionPanelData> data;

  @override
  State<ExpansionMenus> createState() => _ExpansionMenusState();
}

class _ExpansionMenusState extends State<ExpansionMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildExpansionList(),
    );
  }

  Widget _buildExpansionList() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.data[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: widget.data.map<ExpansionPanel>(
        ((ExpansionPanelData item) {
          return ExpansionPanel(
            backgroundColor: AppColors.accentBlue,
            canTapOnHeader: true,
            headerBuilder: ((context, isExpanded) {
              return ListTile(
                title: Text(
                  item.headerValue,
                  style: AppTextStyles.whiteMediumText,
                ),
              );
            }),
            body: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: item.expandedValue,
            ),
            isExpanded: item.isExpanded,
          );
        }),
      ).toList(),
    );
  }
}
