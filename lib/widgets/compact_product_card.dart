import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import '../models/product_model.dart';
import 'package:intl/intl.dart';

class CompactProductCardWidget extends StatelessWidget {
  final ProductModel item;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool showStockInfo;
  final bool showAddToCart;
  final bool showFavoriteIcon;
  final bool showLabel;
  final bool showOfficialStoreLabel;
  final bool showRating;

  const CompactProductCardWidget({
    super.key,
    required this.item,
    this.onTap,
    this.width = 200,
    this.height = 300,
    this.showStockInfo = false,
    this.showAddToCart = false,
    this.showFavoriteIcon = false,
    this.showLabel = false,
    this.showOfficialStoreLabel = false,
    this.showRating = false,
  });

  Widget _buildImage(BuildContext context) {
    return Container(
      width: 150, // Increased image size
      height: 150, // Increased image size
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: item.imageUrls.isNotEmpty
                ? CachedNetworkImage(
              imageUrl: item.imageUrls.first,
              width: 150,
              height: 150,
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
              width: 150,
              height: 150,
              color: Colors.grey[200],
              child: Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ),
          if (item.discountPercentage != null)
            Positioned(
              top: -10,
              right: -10,
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
          if (showLabel && item.label != null)
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: item.label!.backgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.label!.label,
                  style: TextStyle(
                    color: item.label!.textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (showFavoriteIcon)
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasBottomSection = showRating || showStockInfo || showAddToCart || showOfficialStoreLabel;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _buildImage(context),
                ),
              ),
              if (showOfficialStoreLabel && item.isOfficialStore)
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Official Store',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title ?? '',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Price row - aligned differently based on layout
                      if (hasBottomSection && item.originalPrice != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₦${NumberFormat('#,##0').format(item.price)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
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
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '₦${NumberFormat('#,##0').format(item.price)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            if (item.originalPrice != null &&
                                item.discountPercentage != null)
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
                      if (showRating && item.rating != null && item.ratingCount != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                '${item.rating!.toStringAsFixed(1)} (${item.ratingCount})',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (showStockInfo &&
                          item.itemsLeft != null &&
                          item.totalUnits != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${item.itemsLeft} items left',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.backgroundDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: item.itemsLeft! / item.totalUnits!,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.goldenAmber,
                            ),
                            minHeight: 8,
                          ),
                        ),
                      ],
                      if (showAddToCart) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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