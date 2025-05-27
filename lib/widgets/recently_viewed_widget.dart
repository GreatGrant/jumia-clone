import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

import '../models/item_model.dart';
import 'compact_item_card.dart';

class RecentlyViewedWidget extends StatelessWidget {
  final List items;
  final String title;
  final VoidCallback? onSeeAll;
  final void Function(ItemModel item)? onItemTap;
  final double? cardWidth;
  final double? cardHeight;
  final EdgeInsets? padding;

  const RecentlyViewedWidget({
    super.key,
    required this.items,
    this.title = 'Recently Viewed',
    this.onSeeAll,
    this.onItemTap,
    this.cardWidth = 180,
    this.cardHeight = 214,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          Padding(
            padding: padding!,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
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

          // Horizontal ListView with compact cards
          SizedBox(
            height: cardHeight! + 20, // Add some padding
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: padding!.left,
                right: padding!.right,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  margin: EdgeInsets.only(
                    right: index < items.length - 1 ? 12.0 : 0,
                  ),
                  child: CompactItemCardWidget(
                    item: item,
                    width: cardWidth,
                    height: cardHeight,
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