import 'package:intl/intl.dart';

class PurchaseData {
  final String productName;
  final int cost;
  final DateTime time;
  late String purchaseTime;

  PurchaseData(this.productName, this.cost, this.time) {
    purchaseTime =
        "${DateFormat("Hm").format(time)} ${DateFormat("yMMMd").format(time)}";
  }
}
