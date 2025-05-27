import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/retry_button.dart';

class NoConnectionWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;

  const NoConnectionWidget({
    super.key,
    required this.onRetry,
    this.icon = Icons.wifi_off,
    this.title = 'No connection',
    this.subtitle = 'An internet error occurred, please try again',
    this.buttonText = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
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
                color: AppColors.textDark
              )
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
            RetryButton(text: buttonText, onPressed: (){})
          ],
        ),
      ),
    );
  }
}
