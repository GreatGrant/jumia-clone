import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progressValue;
  final double totalValue;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final double borderRadius;

  const CustomProgressBar({
    super.key,
    required this.progressValue,
    required this.totalValue,
    this.height = 8,
    this.backgroundColor = AppColors.grey,
    this.progressColor = AppColors.amber,
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: LinearProgressIndicator(
        value: progressValue / totalValue,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        minHeight: height,
      ),
    );
  }
}