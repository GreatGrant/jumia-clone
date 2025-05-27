import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import '../models/item_model.dart';
import 'package:intl/intl.dart';

class CompactItemCardWidget extends StatelessWidget {
  final ItemModel item;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const CompactItemCardWidget({
    super.key,
    required this.item,
    this.onTap,
    this.width = 200,
    this.height = 280,
  });

  Widget _buildImage(BuildContext context) {
    return Container(
      width: 127,
      height: 127,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8), // Added border radius for image
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allows badge to overflow
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Match container radius
            child: item.imageUrls.isNotEmpty
                ? CachedNetworkImage(
              imageUrl: item.imageUrls.first,
              width: 127,
              height: 127,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
                child: Icon(
                  Icons.broken_image,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
            )
                : Container(
              width: 127,
              height: 127,
              color: Colors.grey[200],
              child: Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ),

          // Discount Badge - Positioned at 90° angle on the edge
          if (item.discountPercentage != null)
            Positioned(
              top: -10, // Half outside
              right: -10, // Half outside
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.orangeFaint,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangeFaint,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Text(
                  '-${item.discountPercentage!.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image with discount badge
              Padding(
                padding: const EdgeInsets.only(top: 10), // Space for the badge
                child: _buildImage(context),
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        item.title ?? '',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Price section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Current price
                          Text(
                            '₦${NumberFormat('#,##0').format(item.price)}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          // Original price (if there's a discount)
                          if (item.originalPrice != null && item.discountPercentage != null)
                            Text(
                              '₦${NumberFormat('#,###').format(item.originalPrice)}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey[600],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}