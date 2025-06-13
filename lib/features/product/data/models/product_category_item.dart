import 'dart:ui';

class CategoryItem {
  final String title;
  final bool isSelected;

  CategoryItem({required this.title, required this.isSelected});
}

class ProductCategoryItem {
  final String name;
  final String imageUrl;
  final VoidCallback? onTap;

  ProductCategoryItem({
    required this.name,
    required this.imageUrl,
    this.onTap,
  });
}
