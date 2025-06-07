import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/models/product_model.dart';
import 'package:jumia_clone/theme/colors.dart';

import '../widgets/persistent_footer_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required ProductModel product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              //TODO: Navigate to search screen
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              //TODO: Navigate to cart screen
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
            itemBuilder: (BuildContext context) => [
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
      ),
      body: Placeholder(),
      bottomNavigationBar: PersistentFooterWidget(
          onHomePressed: () {
            print('Home pressed');
          },
          onCallPressed: () {
            print('Call pressed');
          },
          onAddToCartPressed: () {
            print('Add to cart pressed');
          },
        ),
    );
  }
}
