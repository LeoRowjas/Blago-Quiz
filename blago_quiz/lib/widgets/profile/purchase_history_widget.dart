import 'package:blago_quiz/widgets/store/store_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PurchasesTable(
        purchases: User.purchases.value,
      ),
    );
  }
}

class PurchaseData {
  final Product product;
  final DateTime time;
  late String purchaseTime;

  PurchaseData(this.product, this.time) {
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
                    purchases[index].product.name,
                    style: AppTextStyles.whiteMediumText,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    purchases[index].product.cost.toString(),
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
