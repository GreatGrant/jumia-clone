import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';

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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
            _buildIconButton(
              icon: Icons.home_outlined,
              onPressed: onHomePressed,
            ),
            const SizedBox(width: 12),
            _buildIconButton(
              icon: Icons.phone,
              onPressed: onCallPressed,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
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
                      mainAxisAlignment: MainAxisAlignment.start, // Align children to the start (left)
                      children: [
                        SizedBox(width: 16),
                        Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded( // Expands to push the text to the center
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
            color: const Color(0xFFFF8A00),
            size: 24,
          ),
        ),
      ),
    );
  }
}
