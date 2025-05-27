import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle? textStyle;
  final Color? iconColor;
  final bool isPrice;

  const ItemDetailWidget({
    super.key,
    required this.text,
    required this.icon,
    this.textStyle,
    this.iconColor,
    this.isPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: iconColor ?? Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            isPrice ? '₦$text' : text,
            style: isPrice
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            )
                : textStyle,
            maxLines: isPrice ? 1 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
