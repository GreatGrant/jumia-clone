import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

class ProductSectionHeader extends StatelessWidget {
  final String title;
  final bool showIcon;
  final VoidCallback? onIconTap;

  const ProductSectionHeader({
    super.key,
    required this.title,
    this.showIcon = true,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.black87,
            letterSpacing: 0.9,
          ),
        ),
        if (showIcon)
          GestureDetector(
            onTap: onIconTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.chevron_right,
                color: AppColors.black87,
                size: 24,
              ),
            ),
          ),
      ],
    );
  }
}

