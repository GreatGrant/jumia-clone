import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FlippedOfferIcon extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry padding;
  final Color? baseColor;
  final Color? flashColor;

  const FlippedOfferIcon({
    super.key,
    this.size = 20,
    this.padding = const EdgeInsets.only(right: 8),
    this.baseColor,
    this.flashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(-0.3)  // rotate anticlockwise by ~0.1 radians (~5.7 degrees)
              ..scale(-1.0, 1.0),
            child: Icon(
              Icons.local_offer,
              color: baseColor ?? AppColors.primary,
              size: size,
            ),
          ),
          Icon(
            Icons.bolt,
            size: size * 0.7,
            color: flashColor ?? Colors.white,
          ),
        ],
      ),
    );
  }
}
