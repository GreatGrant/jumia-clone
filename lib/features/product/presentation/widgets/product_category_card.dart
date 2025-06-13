import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

import '../../data/models/product_category_item.dart';

class ProductCategoryCard extends StatelessWidget {
  final ProductCategoryItem category;

  const ProductCategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: category.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image Container with fixed aspect ratio
          AspectRatio(
            aspectRatio: 1.0, // Square aspect ratio
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
              ),
              child: CachedNetworkImage(
                width: 150,
                height: 150,
                imageUrl: category.imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Container(
                  color: AppColors.surface,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF8C00)),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[50],
                  child: const Icon(
                    Icons.computer,
                    size: 48,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Text
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
