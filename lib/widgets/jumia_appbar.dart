import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JumiaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const JumiaAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            context.go('/search');
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            context.go('/cart');
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
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
          },
          itemBuilder: (BuildContext context) => const [
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
          ],
        ),
      ],
    );
  }
}
