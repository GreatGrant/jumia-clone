import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/features/product/data/models/product_model.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import 'package:jumia_clone/features/product/presentation/widgets/price_section.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrls[0],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), // Reduced spacing

            // Product Info Section
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Added this
                children: [
                  // Product Title
                  Flexible( // Changed from Expanded to Flexible
                    child: Text(
                      product.title ?? '', // Added null safety
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      maxLines: 2, // Increased to 2 lines
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4), // Added fixed spacing instead of Spacer

                  // Price Section
                  PriceSection(
                    currentPrice: product.price,
                    originalPrice: product.originalPrice,
                    discountPercentage: product.discountPercentage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

