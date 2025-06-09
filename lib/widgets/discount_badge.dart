import 'package:flutter/material.dart';

import '../theme/colors.dart';

class DiscountBadge extends StatelessWidget {
  final double discount;

  const DiscountBadge({
    super.key,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.orangeFaint,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeFaint,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Text(
        '-${discount.toStringAsFixed(0)}%',
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
