import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FlippedOfferIcon extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry padding;
  final Color? color;

  const FlippedOfferIcon({
    super.key,
    this.size = 20,
    this.padding = const EdgeInsets.only(right: 8),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(-1.0, 1.0),
        child: Icon(
          Icons.local_offer,
          color: color ?? AppColors.primary,
          size: size,
        ),
      ),
    );
  }
}
