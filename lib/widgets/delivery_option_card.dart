import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import '../models/delivery_option.dart';

class DeliveryOptionCard extends StatelessWidget {
  final List<DeliveryOption> option;
  final String currency;
  final VoidCallback? onDetailsPressed;

  const DeliveryOptionCard({
    super.key,
    required this.option,
    required this.currency,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: option.map((e) => _buildCard(e)).toList(),
    );
  }

  Widget _buildCard(DeliveryOption option) {
    final icon = switch (option.icon) {
      'pickup' => Icons.store_outlined,
      _ => Icons.local_shipping_outlined,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column 1: Icon container
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, size: 18, color: AppColors.black87),
          ),

          const SizedBox(width: 12),

          // Column 2: Type, fee, and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.type,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Delivery Fees $currency ${option.fee.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  option.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Column 3: Details button
          if (onDetailsPressed != null)
            TextButton(
              onPressed: onDetailsPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0), // removes default constraints
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
        ],
      ),
    );
  }
}