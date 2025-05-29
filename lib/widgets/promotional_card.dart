import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromotionalCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  const PromotionalCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Card with image/graphic
          Container(
            width: 77, // Fixed width for each card
            height: 77, // Fixed height for each card
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      label[0], // Fallback to first letter of label
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          // Label below the card
          SizedBox(
            width: double.infinity,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        ],
      ),
    );
  }
}