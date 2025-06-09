import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

class ProductRatingDisplay extends StatelessWidget {
  final double? rating;
  final int? ratingCount;
  final double iconSize;

  const ProductRatingDisplay({
    super.key,
    required this.rating,
    required this.ratingCount,
    this.iconSize = 16,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final hasRating = rating != null && ratingCount != null && ratingCount! > 0;
    final double value = (rating ?? 0).clamp(0, 5);
    final int fullStars = value.floor();
    final bool showHalfStar = (value - fullStars) >= 0.25 && (value - fullStars) < 0.75;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: List.generate(5, (index) {
                if (!hasRating) {
                  return Icon(Icons.star, color: AppColors.grey400, size: iconSize);
                }

                if (index < fullStars) {
                  return Icon(Icons.star, color: AppColors.goldenAmber, size: iconSize);
                }

                if (index == fullStars && showHalfStar) {
                  return Stack(
                    children: [
                      Icon(Icons.star, color: AppColors.grey400, size: iconSize),
                      ClipRect(
                        clipper: _HalfClipper(),
                        child: Icon(Icons.star, color: AppColors.goldenAmber, size: iconSize),
                      ),
                    ],
                  );
                }

                return Icon(Icons.star, color: AppColors.grey400, size: iconSize);
              }),
            ),
            const SizedBox(width: 6),
            Text(
              hasRating
                  ? '(${ratingCount!} rating${ratingCount == 1 ? '' : 's'})'
                  : '(No ratings available)',
              style: TextStyle(
                fontSize: 13,
                color: hasRating ? AppColors.deepBlue : AppColors.grey400,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.share, color: AppColors.primary, size: 24),
              onPressed: () {}, // Replace with actual share logic
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.primary, size: 24),
              onPressed: () {}, // Replace with actual favorite logic
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width / 2, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
