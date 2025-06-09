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
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.orangeFaint,
        borderRadius: BorderRadius.circular(2),
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
