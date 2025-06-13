import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import '../../../../shared/providers/cart_provider.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DetailsAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () => context.go('/search'),
        ),
        // Cart Icon with Badge
        Consumer(
          builder: (context, ref, _) {
            final cartItemCount = ref.watch(cartItemCountProvider);
            return Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () => context.go('/cart'),
                ),
                if (cartItemCount > 0)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartItemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) => _handleMenuSelection(context, value),
          itemBuilder: (BuildContext context) => _buildMenuItems(),
        ),
      ],
    );
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'home':
        context.go('/home');
        break;
      case 'categories':
        context.go('/categories');
        break;
      case 'cart':
        context.go('/cart');
        break;
      case 'wishlist':
        context.go('/wishlist');
        break;
      case 'account':
        context.go('/account');
        break;
    }
  }

  List<PopupMenuEntry<String>> _buildMenuItems() {
    return const [
      PopupMenuItem(
        value: 'home',
        child: Row(
          children: [
            Icon(Icons.home_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text('Home'),
          ],
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem(
        value: 'categories',
        child: Row(
          children: [
            Icon(Icons.view_list_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text('Categories'),
          ],
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem(
        value: 'cart',
        child: Row(
          children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text('Cart'),
          ],
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem(
        value: 'wishlist',
        child: Row(
          children: [
            Icon(Icons.favorite_outline, color: Colors.black),
            SizedBox(width: 8),
            Text('Wishlist'),
          ],
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem(
        value: 'account',
        child: Row(
          children: [
            Icon(Icons.person_2_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text('Account'),
          ],
        ),
      ),
    ];
  }
}