import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

import '../models/product_category_item.dart';
import '../widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Row(
        children: [
          // Left Sidebar
          const CategorySidebar(),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Computers Section
                  CategoryGridSection(
                    title: 'Computers',
                    categories: [
                      ProductCategoryItem(
                        name: 'Desktops',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/34/1859882/1.jpg?5744',
                      ),
                      ProductCategoryItem(
                        name: 'Laptops',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/18/8631012/1.jpg?4404',
                      ),
                      ProductCategoryItem(
                        name: 'Monitors',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/82/6538631/1.jpg?2838',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Data Storage Section
                  CategoryGridSection(
                    title: 'Data Storage',
                    categories: [
                      ProductCategoryItem(
                        name: 'External Hard Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/06/4298651/1.jpg?7510',
                      ),
                      ProductCategoryItem(
                        name: 'USB Flash Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/41/8647051/1.jpg?8540',
                      ),
                      ProductCategoryItem(
                        name: 'External Solid State Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/18/6539631/1.jpg?2838',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Antivirus & Security Section
                  CategoryGridSection(
                    title: 'Antivirus & Security',
                    categories: [
                      ProductCategoryItem(
                        name: 'Antivirus',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/345678/1.jpg?1234', // Replace with actual antivirus image URL
                      ),
                      ProductCategoryItem(
                        name: 'Internet Security',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/98/765432/1.jpg?5678', // Replace with actual security software image URL
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Printers Section
                  CategoryGridSection(
                    title: 'Printers',
                    categories: [
                      ProductCategoryItem(
                        name: 'Inkjet Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/11/111111/1.jpg?1111',
                      ),
                      ProductCategoryItem(
                        name: 'Laser Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/22/222222/1.jpg?2222',
                      ),
                      ProductCategoryItem(
                        name: 'Photo Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/33/333333/1.jpg?3333',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Fixed Category Grid Section Widget
class CategoryGridSection extends StatelessWidget {
  final String title;
  final List<ProductCategoryItem> categories;

  const CategoryGridSection({
    super.key,
    required this.title,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with padding
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF8C00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Full width divider
          const Divider(height: 1, thickness: 1),
          const SizedBox(height: 16),

          // Grid with padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                for (int i = 0; i < categories.length; i++) ...[
                  Expanded(
                    child: ProductCategoryCard(category: categories[i]),
                  ),
                  if (i < categories.length - 1) const SizedBox(width: 16),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
// Fixed Product Category Card
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
                color: Colors.grey[50],
              ),
              child: CachedNetworkImage(
                width: 150,
                height: 150,
                imageUrl: category.imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Container(
                  color: Colors.grey[50],
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

// Fixed Category Sidebar
class CategorySidebar extends StatelessWidget {
  const CategorySidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryItem(title: 'Home & Office', isSelected: false),
      CategoryItem(title: 'Phones & Tablets', isSelected: false),
      CategoryItem(title: 'Fashion', isSelected: false),
      CategoryItem(title: 'Health & Beauty', isSelected: false),
      CategoryItem(title: 'Electronics', isSelected: false),
      CategoryItem(title: 'Computing', isSelected: true), // This should be selected since we're showing computing categories
      CategoryItem(title: 'Grocery', isSelected: false),
      CategoryItem(title: 'Garden & Outdoors', isSelected: false),
      CategoryItem(title: 'Automobile', isSelected: false),
      CategoryItem(title: 'Sporting Goods', isSelected: false),
      CategoryItem(title: 'Gaming', isSelected: false),
      CategoryItem(title: 'Baby Products', isSelected: false),
    ];

    return Container(
      width: 100,
      color: AppColors.lightBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < categories.length; i++) ...[
              CategoryMenuItem(
                title: categories[i].title,
                isSelected: categories[i].isSelected,
              ),
              if (i != categories.length - 1)
                const Divider(height: 1, color: Color(0xFFE5E7EB)),
            ]
          ],
        ),
      ),
    );
  }
}

class CategoryMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryMenuItem({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        border: isSelected
            ? const Border(left: BorderSide(color: Color(0xFFFF8C00), width: 4))
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF111827) : AppColors.textDark,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// Category Item Model (you might need this)
class CategoryItem {
  final String title;
  final bool isSelected;

  CategoryItem({
    required this.title,
    this.isSelected = false,
  });
}