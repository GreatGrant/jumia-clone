import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

import '../models/product_model.dart';
import 'compact_product_card_widget.dart';

class ProductRowWidget extends StatelessWidget {
  final List<ProductModel> items;
  final String? title;
  final VoidCallback? onSeeAll;
  final void Function(ProductModel item)? onItemTap;
  final double? cardWidth;
  final EdgeInsets? padding;
  final bool showStock;
  final bool showLabel;
  final bool showRating;
  final bool showOfficialStoreLabel;
  final bool showAddToCart;
  final bool showFavoriteIcon;

  const ProductRowWidget({
    super.key,
    required this.items,
    this.title,
    this.onSeeAll,
    this.onItemTap,
    this.cardWidth = 180,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    required this.showStock,
    required this.showLabel,
    required this.showRating,
    required this.showOfficialStoreLabel,
    required this.showAddToCart,
    required this.showFavoriteIcon,
  });

  // Calculate the maximum height among all product cards
  double _calculateMaxCardHeight(BuildContext context) {
    double maxHeight = 0;
    for (var item in items) {
      final card = CompactProductCardWidget(
        item: item,
        width: cardWidth,
        showStockInfo: showStock,
        showAddToCart: showAddToCart,
        showFavoriteIcon: showFavoriteIcon,
        showOfficialStoreLabel: showOfficialStoreLabel,
        showRating: showRating,
        showLabel: showLabel,
      );
      final height = card.calculateHeight(context);
      maxHeight = height > maxHeight ? height : maxHeight;
    }
    return maxHeight;
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final cardHeight = _calculateMaxCardHeight(context);

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          if (title != null || onSeeAll != null)
            Padding(
              padding: padding!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        letterSpacing: 0.8,
                      ),
                    ),
                  if (onSeeAll != null)
                    TextButton(
                      onPressed: onSeeAll,
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // Horizontal ListView with compact cards - reduced height and padding
          SizedBox(
            height: cardHeight, // Removed extra padding
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: padding!.left,
                right: padding!.right,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < items.length - 1 ? 8.0 : 0, // Reduced from 12.0 to 8.0
                  ),
                  child: CompactProductCardWidget(
                    item: item,
                    width: cardWidth,
                    showStockInfo: showStock,
                    showAddToCart: showAddToCart,
                    showFavoriteIcon: showFavoriteIcon,
                    showOfficialStoreLabel: showOfficialStoreLabel,
                    showRating: showRating,
                    showLabel: showLabel,
                    onTap: onItemTap != null ? () => onItemTap!(item) : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}