import 'package:intl/intl.dart';

import '../../store/store_screen_widget.dart';

class PurchaseData {
  final Product product;
  final DateTime time;
  late String purchaseTime;

  PurchaseData(this.product, this.time) {
    purchaseTime =
        "${DateFormat("Hm").format(time)} ${DateFormat("yMMMd").format(time)}";
  }
}
