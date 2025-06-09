import 'package:flutter/material.dart';
import '../core/util/product_tag.dart';

class ProductLabelBadge extends StatelessWidget {
  final ProductTag label;

  const ProductLabelBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: label.padding,
      decoration: BoxDecoration(
        color: label.backgroundColor,
        borderRadius: label.borderRadius,
      ),
      child: Text(
        label.label,
        style: TextStyle(
          color: label.textColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
