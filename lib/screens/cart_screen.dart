import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../widgets/no_connection_widget.dart';
import '../widgets/recently_viewed_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ItemModel> recentlyViewedItems = [
    ItemModel(
      id: '1',
      title: 'Logitech H390 USB Headset',
      description: 'High-quality USB headset with noise-canceling microphone',
      price: 42900,
      imageUrls: ['https://images.unsplash.com/photo-1599669454699-248893623440?w=300&h=300&fit=crop'],
      rating: 4.5,
    ),
    ItemModel(
      id: '2',
      title: 'Havit PC Gaming Cursor',
      description: 'Gaming headset with RGB lighting and surround sound',
      price: 15000,
      originalPrice: 25000,
      discountPercentage: 40,
      imageUrls: ['https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=300&h=300&fit=crop'],
      rating: 4.2,
      itemsLeft: 25,
    ),
    ItemModel(
      id: '3',
      title: 'Wireless Gaming Mouse',
      description: 'High precision wireless gaming mouse with RGB',
      price: 18500,
      originalPrice: 22000,
      discountPercentage: 16,
      imageUrls: ['https://images.unsplash.com/photo-1527814050087-3793815479db?w=300&h=300&fit=crop'],
      rating: 4.7,
      itemsLeft: 12,
    ),
    ItemModel(
      id: '4',
      title: 'Mechanical Keyboard RGB',
      description: 'Gaming keyboard with mechanical switches',
      price: 35000,
      imageUrls: ['https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop'],
      rating: 4.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NoConnectionWidget(
              paddingTop: 16,
              svgPath: 'assets/svg/cart.svg',
              title : 'Your cart is empty!',
              subtitle : 'Browse our categories and discover our best deals!',
              buttonText : 'Start shopping',
              onRetry: (){}),
          RecentlyViewedWidget(
            items: recentlyViewedItems,
            onSeeAll: () {
              print('Navigate to Recently Viewed page');
            },
            onItemTap: (item) {
              print('Tapped on ${item.title}');
            },
          ),

        ],
      ),
    );
  }
}

