import 'package:intl/intl.dart';

class QuizzModel {
  String theme;
  int score;
  DateTime dateTime;
  late String passTime;

  QuizzModel(this.theme, this.score, this.dateTime) {
    passTime =
        "${DateFormat("Hm").format(dateTime)} ${DateFormat("yMMMd").format(dateTime)}";
  }
}
