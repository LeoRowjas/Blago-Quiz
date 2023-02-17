import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/profileScreen/passed_quizzes_history_widget.dart';
import 'package:blago_quiz/widgets/profileScreen/purchase_history_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreenWidget extends StatelessWidget {
  ProfileScreenWidget({
    super.key,
  });

  final List<ExpansionPanelData> data = [
    ExpansionPanelData(
      headerValue: "Пройденные викторины",
      expandedValue: PassedQuizzesHistoryWidget(),
    ),
    ExpansionPanelData(
      headerValue: "Покупки",
      expandedValue: PurchaseHistory(),
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
            const Divider(
              height: 40,
              thickness: 1.5,
              color: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}

class ButtonsTest extends StatelessWidget {
  const ButtonsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: const [
            Icon(Icons.history),
            SizedBox(width: 8),
            Expanded(child: Text("История пройденных викторин")),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}

class _TopInfoProfileWidget extends StatelessWidget {
  const _TopInfoProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CircleAvatar(
            backgroundImage: AssetImage(DevImages.lenyaValyazhniy),
            radius: 70,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Лёнька Лох",
            style: AppTextStyles.blackHeader,
          ),
        ),
        Text(
          "Пройдено викторин - 24",
          style: AppTextStyles.additionalGreyText,
        )
      ],
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
                  style: AppTextStyles.whiteLargeText,
                ),
              );
            }),
            body: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: item.expandedValue,
            ),
            isExpanded: item.isExpanded,
          );
        }),
      ).toList(),
    );
  }
}
