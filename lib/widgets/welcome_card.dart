import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

class WelcomeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const WelcomeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  )
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.surface
                )
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.surface
            )
          ),
        ),
      ],
    );
  }
}
