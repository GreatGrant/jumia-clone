import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/features/product/presentation/widgets/products_section_header.dart';
import 'package:jumia_clone/features/product/presentation/widgets/review_item.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import 'package:jumia_clone/features/product/presentation/widgets/review_model.dart';

class ProductRatingReviews extends StatelessWidget {
  final double overallRating;
  final int totalRatings;
  final List<ReviewModel> reviews;
  final VoidCallback? onViewAllReviews;

  const ProductRatingReviews({
    super.key,
    required this.overallRating,
    required this.totalRatings,
    required this.reviews,
    this.onViewAllReviews,
  });

  @override
  Widget build(BuildContext context) {
    final hasReviews = reviews.isNotEmpty;
    final displayReviews = reviews.take(4).toList();

    return Container(
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSectionHeader(
              title: 'Product Rating & Reviews',
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.goldenAmber,
                      width: 0.5,
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: overallRating.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.goldenAmber,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '/5',
                          style: TextStyle(
                            color: AppColors.goldenAmber,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '($totalRatings ratings)',
                  style: TextStyle(color: AppColors.black87, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 2),
            const Divider(),
            const SizedBox(height: 16),

            if (hasReviews)
              ...displayReviews.map((review) => ReviewItem(review: review))
            else
              Center(
                child: Text(
                  'No reviews yet',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
