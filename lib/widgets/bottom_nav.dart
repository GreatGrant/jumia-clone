// Bottom Navigation Bar Custom Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../models/nav_item_data.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarCustom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const Color selectedColor = Color(0xFFF68C1E);
  static const Color unselectedColor = Color(0xFF282828);

  static const List<NavItemData> _items = [
    NavItemData(Icons.home_outlined, Icons.home, 'Home'),
    NavItemData(Icons.view_list_outlined, Icons.view_list, 'Categories'),
    NavItemData(Icons.shopping_cart_outlined, Icons.shopping_cart, 'Cart'),
    NavItemData(Icons.favorite_outline, Icons.favorite, 'Wishlist'),
    NavItemData(Icons.person_outline, Icons.person, 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isSelected = currentIndex == index;
              final icon = isSelected ? item.filledIcon : item.outlinedIcon;
              final color = isSelected ? selectedColor : unselectedColor;

              return GestureDetector(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: color, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

