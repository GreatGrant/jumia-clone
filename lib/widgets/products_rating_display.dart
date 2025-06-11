import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'star_rating.dart';

class ProductRatingDisplay extends StatelessWidget {
  final double? rating;
  final int? ratingCount;
  final double iconSize;

  const ProductRatingDisplay({
    super.key,
    required this.rating,
    this.ratingCount,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final hasRating = rating != null && rating! > 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            StarRating(
              rating: hasRating ? rating! : 0,
              size: iconSize,
              showGrayWhenEmpty: true,
            ),
            if (ratingCount != null && ratingCount! > 0) ...[
              const SizedBox(width: 6),
              Text(
                '(${ratingCount!} rating${ratingCount == 1 ? '' : 's'})',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.deepBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.share, color: AppColors.primary, size: 24),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.primary, size: 24),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}
