import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';

class StrikethroughPrice extends StatelessWidget {
  final double price;
  final double fontSize;
  final Color? color;

  const StrikethroughPrice({
    super.key,
    required this.price,
    this.fontSize = 13,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '₦${NumberFormat('#,###').format(price)}',
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.grey,
        decoration: TextDecoration.lineThrough,
        decorationColor: AppColors.grey,
      ),
    );
  }
}
