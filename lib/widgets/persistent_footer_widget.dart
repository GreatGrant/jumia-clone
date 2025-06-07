import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart'; // For SystemChrome


class PersistentFooterWidget extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onCallPressed;
  final VoidCallback? onAddToCartPressed;

  const PersistentFooterWidget({
    super.key,
    this.onHomePressed,
    this.onCallPressed,
    this.onAddToCartPressed,
  });

  static const BorderRadius _buttonRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: _buildIconButton(
                icon: Icons.home_outlined,
                onPressed: onHomePressed,
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: _buildIconButton(
                icon: Icons.phone,
                onPressed: onCallPressed,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: 46,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF8A00), AppColors.primary],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: _buttonRadius,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onAddToCartPressed,
                    borderRadius: _buttonRadius,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 16), // Space before icon
                        Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: _buttonRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: _buttonRadius,
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
      ),
    );
  }
}

