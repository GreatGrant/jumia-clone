import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../theme/colors.dart'; // Assuming AppColors is defined here
import '../models/product_model.dart'; // Assuming ProductModel is defined here

class CompactProductCardWidget extends StatelessWidget {
  final ProductModel item;
  final double? width;
  final bool showStockInfo;
  final bool showAddToCart;
  final bool showFavoriteIcon;
  final bool showLabel;
  final bool showOfficialStoreLabel;
  final bool showRating;

  const CompactProductCardWidget({
    super.key,
    required this.item,
    this.width = 200,
    this.showStockInfo = false,
    this.showAddToCart = false,
    this.showFavoriteIcon = false,
    this.showLabel = false,
    this.showOfficialStoreLabel = false,
    this.showRating = false,
  });

  // Calculate the dynamic height based on visible components
  double calculateHeight(BuildContext context) {
    double height = 0;

    // Image height + top padding
    height += 150 + 10; // Image (150) + top padding (10)

    // Official store label (if shown)
    if (showOfficialStoreLabel && item.isOfficialStore) {
      height += 18 + 4; // Label height (18) + padding (4)
    }

    // Content padding (top)
    height += 8; // Reduced from 12

    // Title (2 lines max, using titleSmall)
    final textStyle = Theme.of(context).textTheme.titleSmall;
    height += (textStyle?.fontSize ?? 14) * 2 * 1.3; // 2 lines with line height

    // Spacing after title
    height += 4;

    // Price section
    final priceStyle = Theme.of(context).textTheme.titleMedium;
    if (showRating || showStockInfo || showAddToCart || showOfficialStoreLabel) {
      // Price and original price in a row
      height += (priceStyle?.fontSize ?? 16) * 1.2; // Single line height
    } else {
      // Price and original price in a column
      height += (priceStyle?.fontSize ?? 16) * 1.2; // Price
      if (item.originalPrice != null && item.discountPercentage != null) {
        height += 13 + 4; // Original price (13) + spacing (4)
      }
    }

    // Rating (if shown)
    if (showRating && item.rating != null && item.ratingCount != null) {
      height += 16 + 4; // Rating height (16) + padding (4)
    }

    // Stock info (if shown)
    if (showStockInfo && item.itemsLeft != null && item.totalUnits != null) {
      height += 11 + 4 + 8 + 8 + 2; // Text (11) + spacing (4) + progress bar (8) + spacing (8) + buffer (2)
    }

    // Add to cart button (if shown)
    if (showAddToCart) {
      height += 12 + 30; // Spacing (12) + button height (30)
    }

    // Bottom padding - reduced
    height += 8; // Reduced from 12

    return height; // Removed extra buffer
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
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
                    fontWeight: FontWeight.w900,
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
                  color: Colors.white.withValues(alpha: 0.7),
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
    final calculatedHeight = calculateHeight(context);

    return SizedBox(
      width: width,
      height: calculatedHeight,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.grey800.withValues(alpha: 0.2), // Added for ripple effect
          highlightColor: AppColors.primary.withValues(alpha: 0.1), // Added for highlight effect
          onTap: ()=>{ context.push('/details', extra: item) } ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                      color: AppColors.cyan,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Official Store',
                      style: TextStyle(
                        color: AppColors.surface,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8), // Reduced from 12
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    // Price row - aligned differently based on layout
                    if (hasBottomSection && item.originalPrice != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₦${NumberFormat('#,##0').format(item.price)}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₦${NumberFormat('#,###').format(item.originalPrice)}',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.grey600,
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
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
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
                    if (showStockInfo && item.itemsLeft != null && item.totalUnits != null) ...[
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
            ],
          ),
        ),
      ),
    );
  }
}