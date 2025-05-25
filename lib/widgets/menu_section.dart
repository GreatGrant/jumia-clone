import 'package:flutter/material.dart';
import 'menu_list.dart';
import 'section_header.dart';

class MenuSection extends StatelessWidget {
  final String title;
  final List<MenuListItem> items;

  const MenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: title),
          Divider(height: 2, color: Color(0xFFF1F1F1),),
          const SizedBox(height: 2),
          ...items,
        ],
      ),
    );
  }
}
