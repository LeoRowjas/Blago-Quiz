import 'package:blago_quiz/widgets/profile/profile_screen_widget.dart';
import 'package:blago_quiz/widgets/profile/purchase_history_widget.dart';
import 'package:flutter/material.dart';
import 'store_screen_widget.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';

class BuySheetWidget extends StatefulWidget {
  BuySheetWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  List<BorderSide> deliveryBorders = [const BorderSide(), const BorderSide()];
  final int deliveryCost = 500;
  bool homeDeliveryPressed = false;
  bool myselfdeliveryPressed = false;
  bool showErrorText = false;

  @override
  State<BuySheetWidget> createState() => _BuySheetWidgetState();
}

class _BuySheetWidgetState extends State<BuySheetWidget> {
  @override
  Widget build(BuildContext context) {
    int finalPrice = widget.homeDeliveryPressed
        ? widget.product.cost + widget.deliveryCost
        : widget.product.cost;

    void onPurchase() {
      if (User.balance.value >= finalPrice) {
        widget.showErrorText = false;
        Navigator.pop(context);
        User.balance.value -= finalPrice;
        User.purchases.value.add(PurchaseData(widget.product, DateTime.now()));
        setState(() {});
      } else {
        widget.showErrorText = true;
        setState(() {});
      }
    }

    return SizedBox(
      height: 454,
      child: Column(
        children: [
          HeaderBottomSheetWidget(product: widget.product),
          Center(
            //Две кнопки выбора способа доставки здесь
            child: Column(
              children: [
                SizedBox(
                  width: 370,
                  child: OutlinedButton(
                    onPressed: () {
                      if (!widget.homeDeliveryPressed) {
                        widget.myselfdeliveryPressed = false;
                        widget.homeDeliveryPressed = true;
                        setState(() {
                          widget.deliveryBorders[0] = const BorderSide(
                              width: 2, color: AppColors.pastelYellow);
                          widget.deliveryBorders[1] = const BorderSide();
                        });
                      }
                    },
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        side: MaterialStateProperty.all(
                            widget.deliveryBorders[0])),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(
                                Icons.home,
                                color: Colors.black,
                              )),
                              const WidgetSpan(child: SizedBox(width: 10)),
                              const TextSpan(
                                  text: "КУРЬЕРСКАЯ ДОСТАВКА НА ДОМ",
                                  style: AppTextStyles.blackLargeText),
                              const TextSpan(
                                text: "\n3-5 РАБОЧИХ ДНЕЙ",
                                style: AppTextStyles.additionalGreyText,
                              ),
                              TextSpan(
                                text: "\n${widget.deliveryCost}",
                                style: AppTextStyles.additionalGreyText,
                              ),
                              const WidgetSpan(
                                child: Icon(Icons.diamond_outlined,
                                    color: AppColors.sapphireColor, size: 16),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 370,
                  child: OutlinedButton(
                    onPressed: () {
                      if (!widget.myselfdeliveryPressed) {
                        widget.myselfdeliveryPressed = true;
                        widget.homeDeliveryPressed = false;
                        setState(() {
                          widget.deliveryBorders[1] = const BorderSide(
                              width: 2, color: AppColors.pastelYellow);
                          widget.deliveryBorders[0] = const BorderSide();
                        });
                      }
                    },
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        side: MaterialStateProperty.all(
                            widget.deliveryBorders[1])),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.point_of_sale_rounded,
                                color: Colors.black,
                              )),
                              WidgetSpan(child: SizedBox(width: 10)),
                              TextSpan(
                                  text: "САМОВЫВОЗ ИЗ ПУНКТА ВЫДАЧИ",
                                  style: AppTextStyles.blackLargeText),
                              TextSpan(
                                text: "\nДОСТАВКА В ПУНКТ ВЫДАЧИ - 7 ДНЕЙ",
                                style: AppTextStyles.additionalGreyText,
                              ),
                              TextSpan(
                                text: "\n0",
                                style: AppTextStyles.additionalGreyText,
                              ),
                              WidgetSpan(
                                child: Icon(Icons.diamond_outlined,
                                    color: AppColors.sapphireColor, size: 16),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Итоговая стоимость - $finalPrice",
                          style: AppTextStyles.blackLargeText),
                      const WidgetSpan(
                          child: Icon(
                        Icons.diamond_outlined,
                        size: 18,
                        color: AppColors.sapphireColor,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (widget.showErrorText)
            const Text(
              "Недостаточно средств",
              style: TextStyle(
                  color: AppColors.errorRed,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          else
            const Text(
              "",
              style: TextStyle(
                  color: AppColors.errorRed,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onPurchase,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: AppColors.accentBlue),
              child: const Text(
                "Купить",
                style: AppTextStyles.whiteHeader3Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderBottomSheetWidget extends StatelessWidget {
  const HeaderBottomSheetWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 4,
          child: Image(image: product.image, width: 150, height: 150),
        ),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: AppTextStyles.blackHeader,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: product.cost.toString(),
                        style: AppTextStyles.blackMediumText),
                    const WidgetSpan(
                        child: Icon(
                      Icons.diamond_outlined,
                      color: AppColors.sapphireColor,
                      size: 18,
                    ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
