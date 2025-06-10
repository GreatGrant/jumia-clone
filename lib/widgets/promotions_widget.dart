import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/products_section_header.dart';
import 'package:jumia_clone/widgets/section_header.dart';

import '../models/promotion.dart';

class PromotionsWidget extends StatelessWidget {
  final List<Promotion> promotions;

  const PromotionsWidget({
    super.key,
    required this.promotions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductSectionHeader(
            title: "Promotions",
            showIcon: false,
          ),
          Divider(),
          const SizedBox(height: 16),
          ...promotions.asMap().entries.map((entry) {
            final index = entry.key;
            final promotion = entry.value;

            return Padding(
              padding: EdgeInsets.only(
                bottom: index == promotions.length - 1 ? 0 : 12,
              ),
              child: GestureDetector(
                onTap: promotion.onTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(right: 12, top: 2),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        promotion.text,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.deepBlue,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}