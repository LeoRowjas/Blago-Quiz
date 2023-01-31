import 'package:flutter/material.dart';

class PassedQuizzesHistoryWidget extends StatefulWidget {
  const PassedQuizzesHistoryWidget({super.key});

  @override
  State<PassedQuizzesHistoryWidget> createState() =>
      PassedQuizzesHistoryWidgetState();
}

class PassedQuizzesHistoryWidgetState
    extends State<PassedQuizzesHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(outside: const BorderSide()),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(9),
        1: FlexColumnWidth(5),
        2: FlexColumnWidth(5),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: const [
        TableRow(
          decoration: ShapeDecoration(
              shape: Border.symmetric(
                  vertical: BorderSide(color: Colors.blue),
                  horizontal: BorderSide(color: Colors.blue))),
          children: [
            Text("Тема"),
            Text("Баллы"),
            Text("Дата"),
          ],
        ),
        TableRow(
          decoration: ShapeDecoration(
              shape: Border.symmetric(
                  vertical: BorderSide(color: Colors.blue),
                  horizontal: BorderSide(color: Colors.blue))),
          children: [
            Text("Кино и мультики"),
            Text("300"),
            Text("09.08.2005"),
          ],
        )
      ],
    );
  }
}
