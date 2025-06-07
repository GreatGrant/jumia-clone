import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/jumia_data.dart';
import 'package:jumia_clone/models/brand_model.dart';

import '../models/product_model.dart';
import '../widgets/no_connection_widget.dart';
import '../widgets/product_row_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ProductModel> recentlyViewedItems = [
    ProductModel(
      id: '1',
      isOfficialStore: true,
      title: 'Logitech H390 USB Headset',
      description: 'High-quality USB headset with noise-canceling microphone',
      price: 42900,
      imageUrls: ['https://images.unsplash.com/photo-1599669454699-248893623440?w=300&h=300&fit=crop'],
      rating: 4.5,
      brandId: "Havit",
    ),
    ProductModel(
      id: '2',
      isOfficialStore: true,
      title: 'Havit PC Gaming Cursor',
      description: 'Gaming headset with RGB lighting and surround sound',
      price: 15000,
      originalPrice: 25000,
      discountPercentage: 40,
      imageUrls: ['https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=300&h=300&fit=crop'],
      rating: 4.2,
      itemsLeft: 25,
      brandId: 'Havit',
    ),
    ProductModel(
      id: '3',
      isOfficialStore: false,
      title: 'Wireless Gaming Mouse',
      description: 'High precision wireless gaming mouse with RGB',
      price: 18500,
      originalPrice: 22000,
      discountPercentage: 16,
      imageUrls: ['https://images.unsplash.com/photo-1527814050087-3793815479db?w=300&h=300&fit=crop'],
      rating: 4.7,
      itemsLeft: 12,
      brandId: 'Havit',
    ),
    ProductModel(
      id: '4',
      isOfficialStore: false,
      title: 'Mechanical Keyboard RGB',
      description: 'Gaming keyboard with mechanical switches',
      price: 35000,
      imageUrls: ['https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop'],
      rating: 4.3,
        brandId: 'Havit'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the Home screen
            context.go('/home');
            },
        )),
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
          ProductRowWidget(
              items: recentlyViewedItems,
              title: "Recently Viewed",
              showStock: false,
              showLabel: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showRating: false,
              showFavoriteIcon: false,
            onSeeAll: () {
              print('Navigate to Recently Viewed page');
            },
          ),

        ],
      ),
    );
  }
}

