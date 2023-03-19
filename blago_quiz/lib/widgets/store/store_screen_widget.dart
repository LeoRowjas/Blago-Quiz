import 'package:blago_quiz/resources/resources.dart';
import 'package:blago_quiz/theme/app_colors.dart';
import 'package:blago_quiz/theme/text_styles.dart';
import 'package:flutter/material.dart';

class StoreScreenWidget extends StatelessWidget {
  const StoreScreenWidget({super.key});

  final List<Product> products = const [
    Product(
      name: "Ручка",
      cost: 540,
      image: AssetImage(ProductImage.pen),
    ),
    Product(
      name: "Футболка",
      cost: 4000,
      image: AssetImage(ProductImage.shirt),
    ),
    Product(
      name: "Шоппер",
      cost: 3000,
      image: AssetImage(ProductImage.shopper),
    ),
    Product(
      name: "Билеты в театр",
      cost: 7500,
      image: AssetImage(ProductImage.tickets),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProductTileWidget(product: products[0]),
            ProductTileWidget(product: products[1]),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProductTileWidget(product: products[2]),
            ProductTileWidget(product: products[3]),
          ],
        ),
      ],
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
            child: Image(image: product.image, alignment: Alignment.topCenter),
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.accentBlue)),
              onPressed: () {},
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
