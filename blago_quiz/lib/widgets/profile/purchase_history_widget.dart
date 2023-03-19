import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class PurchaseHistory extends StatefulWidget {
  PurchaseHistory({super.key});

  final List<PurchaseData> purchases = [
    PurchaseData("Ручка", 500, DateTime(2023, 2, 14, 14, 48)),
    PurchaseData("Худи", 5000, DateTime(2023, 2, 14, 14, 48)),
    PurchaseData("Кружка", 1500, DateTime(2023, 2, 14, 14, 48)),
    PurchaseData("Записная книжка", 1200, DateTime(2023, 2, 14, 14, 48)),
    PurchaseData("Браслет", 750, DateTime(2023, 2, 14, 14, 48)),
  ];

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PurchasesTable(
        purchases: widget.purchases,
      ),
    );
  }
}

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

class _PurchasesTable extends StatelessWidget {
  const _PurchasesTable({required this.purchases});
  final List<PurchaseData> purchases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.pastelYellow,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Expanded(
                  flex: 6,
                  child: Text("Товар", style: AppTextStyles.blackMediumText),
                ),
                Expanded(
                  flex: 5,
                  child:
                      Text("Стоимость", style: AppTextStyles.blackMediumText),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Дата", style: AppTextStyles.blackMediumText),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        _PurchaseTableItems(purchases: purchases)
      ],
    );
  }
}

//TODO: создать система инхеритед виджетов, чтобы не прокидывать через конструкторы каждый раз данные
class _PurchaseTableItems extends StatelessWidget {
  const _PurchaseTableItems({required this.purchases});

  final List<PurchaseData> purchases;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: purchases.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(140, 0, 0, 0)),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.sapphireColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    purchases[index].productName,
                    style: AppTextStyles.whiteMediumText,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    purchases[index].cost.toString(),
                    style: AppTextStyles.whiteMediumText,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    purchases[index].purchaseTime,
                    style: AppTextStyles.whiteMediumText,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
