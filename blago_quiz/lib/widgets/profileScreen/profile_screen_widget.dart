import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:blago_quiz/widgets/profileScreen/passed_quizzes_history_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => ProfileScreenWidgetState();
}

class ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _TopInfoProfileWidget(),
            Divider(
              height: 40,
              thickness: 1.5,
              color: Colors.black,
            ),
            ExpansionTest(),
            Divider(
              height: 40,
              thickness: 1.5,
              color: Colors.black,
            ),
            ButtonsTest(),
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

class Item {
  Widget expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generaeItems(int numOfItems) {
  return List<Item>.generate(numOfItems, (index) {
    return Item(
      expandedValue: Text("This is item number ${index + 1}"),
      headerValue: "Header ${index + 1}",
    );
  });
}

class ExpansionTest extends StatefulWidget {
  const ExpansionTest({super.key});

  @override
  State<ExpansionTest> createState() => _ExpansionTestState();
}

class _ExpansionTestState extends State<ExpansionTest> {
  final List<Item> _data = [
    Item(
      expandedValue: const PassedQuizzesHistoryWidget(),
      headerValue: "Пройденные викторины",
    ),
    Item(
      expandedValue: const Text("ТУТ БУДЕТ ИСТОРИЯ ПОКУПОК"),
      headerValue: "Покупки",
    ),
  ];

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
          _data[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>(
        ((Item item) {
          return ExpansionPanel(
            headerBuilder: ((context, isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            }),
            body: ListTile(
              title: item.expandedValue,
            ),
            isExpanded: item.isExpanded,
          );
        }),
      ).toList(),
    );
  }
}
