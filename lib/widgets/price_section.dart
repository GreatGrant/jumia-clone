import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jumia_clone/theme/colors.dart';

class PriceSection extends StatelessWidget {
  final double currentPrice;
  final double? originalPrice;
  final double? discountPercentage;

  const PriceSection({
    super.key,
    required this.currentPrice,
    this.originalPrice,
    this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Added this
      children: [
        // Current Price
        Text(
          "₦${NumberFormat('#,###').format(currentPrice)}", // Fixed formatting
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 2),

        // Original Price and Discount
        if (originalPrice != null && discountPercentage != null)
          Row(
            children: [
              Flexible(
                // Added Flexible wrapper
                child: Text(
                  "₦${NumberFormat('#,###').format(originalPrice!)}",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.grey600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.orangeFaint,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangeFaint.withValues(alpha: 0.1),
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Text(
                  "-${discountPercentage!.toInt()}%",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
