import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ProductRatingDisplay extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final double iconSize;

  const ProductRatingDisplay({
    super.key,
    required this.rating,
    required this.ratingCount,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int totalStars = hasHalfStar ? fullStars + 1 : fullStars;

    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            if (index < fullStars) {
              return Icon(Icons.star, color: AppColors.primary, size: iconSize);
            } else if (index == fullStars && hasHalfStar) {
              return Icon(Icons.star_half, color: AppColors.primary, size: iconSize);
            } else {
              return Icon(Icons.star_border, color: AppColors.primary, size: iconSize);
            }
          }),
        ),
        const SizedBox(width: 6),
        Text(
          '($ratingCount rating${ratingCount == 1 ? '' : 's'})',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
