import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/features/product/presentation/widgets/products_section_header.dart';
import 'package:jumia_clone/core/theme/colors.dart';

class ProductDetailsWidget extends StatelessWidget {
  final List<String> details;
  final int maxLines;

  const ProductDetailsWidget({
    super.key,
    required this.details,
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    final displayedDetails = details.take(maxLines).toList();

    return Container(
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ProductSectionHeader(
              title: "Product Details",
              onIconTap: () => context.push('products-details', extra: details),
            ),
          ),
          const Divider(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: displayedDetails.map((detail) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "- ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
