import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cart_provider.dart';
import '../models/product_model.dart';
import '../theme/colors.dart';
import 'custom_icon_button.dart';

class PersistentFooterWidget extends ConsumerWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onCallPressed;
  final ProductModel product;

  const PersistentFooterWidget({
    super.key,
    this.onHomePressed,
    this.onCallPressed,
    required this.product,
  });

  static const BorderRadius _buttonRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInCart = ref.watch(isInCartProvider(product.id));
    final quantity = ref.watch(productQuantityInCartProvider(product.id));
    final cartItem = ref.watch(cartItemForProductProvider(product.id));

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
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomIconButton(
                icon: Icons.home_outlined,
                onPressed: onHomePressed,
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomIconButton(
                icon: Icons.phone,
                onPressed: onCallPressed,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: 46,
                child: isInCart
                    ? _buildQuantityControls(ref, quantity, cartItem?.maxStock ?? 0)
                    : _buildAddToCartButton(ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8A00), AppColors.primary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: _buttonRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ref.read(cartProvider.notifier).addToCart(product);
          },
          borderRadius: _buttonRadius,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16),
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
    );
  }

  Widget _buildQuantityControls(WidgetRef ref, int quantity, int maxStock) {
    final canDecrement = quantity > 0;
    final canIncrement = quantity < maxStock;

    return Row(
      children: [
        // Decrement Button
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: canDecrement ? AppColors.primary : AppColors.grey300,
            borderRadius: _buttonRadius,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: canDecrement
                  ? () {
                ref.read(cartProvider.notifier).decrementQuantity(product.id);
              }
                  : null,
              borderRadius: _buttonRadius,
              child: Icon(
                Icons.remove,
                color: canDecrement ? Colors.white : Colors.grey[500],
                size: 24,
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Quantity Display
        Expanded(
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: _buttonRadius,
            ),
            child: Center(
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black87,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.primary, // Always use primary color
            borderRadius: _buttonRadius,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: canIncrement
                  ? () {
                ref.read(cartProvider.notifier).incrementQuantity(product.id);
              }
                  : null,
              borderRadius: _buttonRadius,
              child: Stack(
                children: [
                  // Base Icon (always visible)
                  Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  // Reduced opacity overlay when disabled
                  if (!canIncrement)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7), // White overlay with 70% opacity
                        borderRadius: _buttonRadius,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
