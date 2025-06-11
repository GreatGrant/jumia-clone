import 'package:flutter/material.dart';
import 'package:jumia_clone/models/review_model.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/star_rating.dart';

import '../core/util/format_time.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StarRating(rating: review.rating.toDouble()),
              const SizedBox(width: 12),
              Text(
                formatDate(review.createdAt),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'by ${review.userName}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              if (review.isVerifiedPurchase)
                Row(
                  children: [
                    Icon(Icons.verified, color: Colors.green[600], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Verified Purchase',
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
