import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final bool showGrayWhenEmpty;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.showGrayWhenEmpty = true,
  });

  @override
  Widget build(BuildContext context) {
    final double value = rating.clamp(0, 5);
    final int fullStars = value.floor();
    final bool showHalfStar = (value - fullStars) >= 0.25 && (value - fullStars) < 0.75;

    return Row(
      children: List.generate(5, (index) {
        if (rating <= 0 && showGrayWhenEmpty) {
          return Icon(Icons.star, color: AppColors.grey400, size: size);
        }

        if (index < fullStars) {
          return Icon(Icons.star, color: AppColors.goldenAmber, size: size);
        }

        if (index == fullStars && showHalfStar) {
          return Stack(
            children: [
              Icon(Icons.star, color: AppColors.grey400, size: size),
              ClipRect(
                clipper: _HalfClipper(),
                child: Icon(Icons.star, color: AppColors.goldenAmber, size: size),
              ),
            ],
          );
        }

        return Icon(Icons.star, color: AppColors.grey400, size: size);
      }),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width / 2, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
