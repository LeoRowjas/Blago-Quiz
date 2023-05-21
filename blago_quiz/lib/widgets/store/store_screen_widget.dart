import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'buy_bottom_sheet_widget.dart';
import 'package:blago_quiz/samples/products.dart';

class StoreScreenWidget extends StatelessWidget {
  const StoreScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: kProducts.length,
      padding: const EdgeInsets.symmetric(vertical: 15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 190,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 228,
      ),
      itemBuilder: ((context, index) {
        return ProductTileWidget(product: kProducts[index]);
      }),
    );
  }
}

class Product {
  final String name;
  final int cost;
  final AssetImage image;

  const Product({required this.name, required this.cost, required this.image});
}

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 228,
      decoration: BoxDecoration(
        border: Border.all(width: 1.8, color: AppColors.accentBlue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: product.image,
              alignment: Alignment.topCenter,
              height: 180,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.accentBlue)),
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (BuildContext context) {
                      return BuySheetWidget(product: product);
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Купить",
                    style: AppTextStyles.whiteMediumText,
                  ),
                  const Text(
                    "|",
                    style: AppTextStyles.whiteMediumText,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "${product.cost} "),
                        const WidgetSpan(
                            child: Icon(
                          Icons.diamond_outlined,
                          size: 16,
                          color: AppColors.sapphireColor,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
