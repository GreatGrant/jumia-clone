import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

class FlashSaleHeader extends StatefulWidget {
  final String timeLeft; // <-- backend-provided

  const FlashSaleHeader({
    super.key,
    required this.timeLeft,
  });

  @override
  State<FlashSaleHeader> createState() => _FlashSaleHeaderState();
}

class _FlashSaleHeaderState extends State<FlashSaleHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.red),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tag Icon
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: Icon(
                Icons.local_offer,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),

          // Flash Sales text and timer
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Flash Sales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: 'TIME LEFT: ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: widget.timeLeft,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Spacer(),

          // See All
          const Text(
            'See All',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
