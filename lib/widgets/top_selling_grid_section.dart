import 'package:flutter/cupertino.dart';
import 'package:jumia_clone/models/product_model.dart';
import 'package:jumia_clone/widgets/product_card.dart';
import 'package:jumia_clone/widgets/top_selling_header.dart';

class TopSellingGridSection extends StatelessWidget {
  final List<ProductModel> products;

  const TopSellingGridSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopSellingHeader(),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ],
    );
  }
}