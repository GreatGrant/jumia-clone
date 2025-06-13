import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

class ActionButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const ActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: icon,
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.surface
              )
            ),
          ],
        ),
      ),
    );
  }
}
