import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class BannerHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? seeAllText;
  final VoidCallback? onSeeAllTap;

  const BannerHeaderWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.seeAllText = "See All",
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: const BoxDecoration(color: AppColors.skyBlue),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title & Subtitle vertically stacked
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (subtitle != null && subtitle!.isNotEmpty)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),

          // See All centered vertically
          if (seeAllText != null && onSeeAllTap != null)
            GestureDetector(
              onTap: onSeeAllTap,
              child: Text(
                seeAllText!,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
