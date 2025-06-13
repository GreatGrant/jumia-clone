import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final BorderRadius borderRadius;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 44,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
