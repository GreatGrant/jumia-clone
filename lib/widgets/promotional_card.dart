import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromotionalCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color backgroundColor;

  const PromotionalCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Keeps background clean
      child: InkWell(
        onTap: (){
          // context.go('/details');
          },
        borderRadius: BorderRadius.circular(4.0),
        child: Column(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Text(
                        label[0],
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
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
      ),
    );
  }
}
