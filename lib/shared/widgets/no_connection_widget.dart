import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import 'package:jumia_clone/shared/widgets/retry_button.dart';

class NoConnectionWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final IconData? icon;
  final String? svgPath;
  final String title;
  final String subtitle;
  final String buttonText;
  final double paddingTop;

  const NoConnectionWidget({
    super.key,
    required this.onRetry,
    this.icon,
    this.svgPath,
    this.paddingTop = 46.0,
    this.title = 'No connection',
    this.subtitle = 'An internet error occurred, please try again',
    this.buttonText = 'Try Again',
  }) : assert(
  icon != null || svgPath != null, 'Either icon or svgPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, paddingTop, 0, 8),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: svgPath != null
                    ? SvgPicture.asset(
                  svgPath!,
                  width: 85,
                  height: 85,
                )
                    : Icon(
                  icon,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 34),
              RetryButton(text: buttonText, onPressed: onRetry),
            ],
          ),
        ),
      ),
    );
  }
}