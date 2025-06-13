import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../data/models/product_category_item.dart';
import 'category_menu_item.dart';

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
      CategoryItem(title: 'Computing', isSelected: true),
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