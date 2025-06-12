import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ReturnPolicyCard extends StatelessWidget {
  final String policyText;
  final VoidCallback onDetailsPressed;

  const ReturnPolicyCard({
    super.key,
    required this.policyText,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column 1: Icon container
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(Icons.keyboard_return, size: 18, color: AppColors.grey600),
        ),

        const SizedBox(width: 12),

        // Column 2: Title and policy text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Return Policy',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                policyText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Column 3: Details button with padding
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: TextButton(
            onPressed: onDetailsPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Details',
              style: TextStyle(
                color: AppColors.deepBlue,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
