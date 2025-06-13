import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class IndicatorDots extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final CarouselSliderController controller;

  const IndicatorDots({super.key, required this.currentIndex, required this.itemCount, required this.controller});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final double distance = (currentIndex - index).abs().toDouble();
        final double size = 8.0 - (distance * 2.0).clamp(0.0, 4.0);
        return GestureDetector(
          onTap: () => controller.animateToPage(index),
          child: Container(
            width: size,
            height: size,
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? AppColors.primary
                  : Colors.grey[400],
            ),
          ),
        );
      }),
    );
  }
}

