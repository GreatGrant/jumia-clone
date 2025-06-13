import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

class InfoBannerController extends StatelessWidget {
  final bool isLoggedIn;
  final bool hasInternet;
  final VoidCallback? onTap;

  const InfoBannerController({
    super.key,
    required this.isLoggedIn,
    required this.hasInternet,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn && hasInternet) {
      // Hide banner if logged in and internet is available
      return const SizedBox.shrink();
    }

    String message;
    if (!hasInternet) {
      message = 'No network connectivity!';
    } else if (!isLoggedIn) {
      message = 'Login to see your balance';
    } else {
      message = '';
    }

    if (message.isEmpty) {
      return const SizedBox.shrink();
    }

    return InfoBanner(
      icon: Icons.account_balance_wallet,
      text: message,
      onTap: onTap,
    );
  }
}

class InfoBanner extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const InfoBanner({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.deepBlue,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF254995),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

