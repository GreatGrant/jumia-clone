import 'package:flutter/material.dart';
import '../theme/colors.dart';

class JumiaExpressSection extends StatelessWidget {
  const JumiaExpressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'JUMIA',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            const SizedBox(width: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.local_shipping, color: Colors.deepOrange, size: 12),
                SizedBox(width: 2),
                Text(
                  'EXPRESS',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'The BEST products, delivered faster.',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 12,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: 'Now PAY on DELIVERY, Cash or Bank Transfer Anywhere, Zero Wahala! '),
              TextSpan(
                text: 'Details',
                style: TextStyle(color: AppColors.deepBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
