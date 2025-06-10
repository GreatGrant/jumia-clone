import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/jumia_data.dart';
import 'package:jumia_clone/models/brand_model.dart';

import '../models/product_details_model.dart';
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
      productDetails: ProductDetails(
        description: 'High-quality USB headset with noise-canceling microphone',
        keyFeatures: [
          'Noise-canceling microphone',
          'USB-A connection',
          'In-line controls',
          'Adjustable headband',
        ],
        specification: {
          'Connectivity': 'Wired (USB)',
          'Microphone': 'Yes, noise-canceling',
          'Weight': '197g',
          'Compatibility': 'Windows, macOS',
        },
      ),
      price: 42900,
      imageUrls: [
        'https://images.unsplash.com/photo-1599669454699-248893623440?w=300&h=300&fit=crop',
      ],
      rating: 4.5,
      brandId: "Havit",
      isFlashSale: false,
    ),
    ProductModel(
      id: '2',
      isOfficialStore: true,
      title: 'Havit PC Gaming Cursor',
      productDetails: ProductDetails(
        description: 'Gaming headset with RGB lighting and surround sound',
        keyFeatures: [
          '7.1 surround sound',
          'RGB lighting',
          'Comfortable ear cushions',
          'Built-in mic',
        ],
        specification: {
          'Connectivity': 'Wired (3.5mm/USB)',
          'Lighting': 'RGB',
          'Microphone': 'Built-in',
          'Compatibility': 'PC, PS4, Xbox',
        },
      ),
      price: 15000,
      originalPrice: 25000,
      discountPercentage: 40,
      imageUrls: [
        'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=300&h=300&fit=crop',
      ],
      rating: 4.2,
      itemsLeft: 25,
      brandId: 'Havit',
      isFlashSale: false,
    ),
    ProductModel(
      id: '3',
      isOfficialStore: false,
      title: 'Wireless Gaming Mouse',
      productDetails: ProductDetails(
        description: 'High precision wireless gaming mouse with RGB',
        keyFeatures: [
          '2.4GHz wireless connection',
          'Adjustable DPI up to 16000',
          'Ergonomic design',
          'RGB lighting',
        ],
        specification: {
          'Connectivity': 'Wireless',
          'DPI Range': '800–16000',
          'Battery Life': 'Up to 50 hours',
          'Buttons': '6 programmable',
        },
      ),
      price: 18500,
      originalPrice: 22000,
      discountPercentage: 16,
      imageUrls: [
        'https://images.unsplash.com/photo-1527814050087-3793815479db?w=300&h=300&fit=crop',
      ],
      rating: 4.7,
      itemsLeft: 12,
      brandId: 'Havit',
      isFlashSale: false,
    ),
    ProductModel(
      id: '4',
      isOfficialStore: false,
      title: 'Mechanical Keyboard RGB',
      productDetails: ProductDetails(
        description: 'Gaming keyboard with mechanical switches',
        keyFeatures: [
          'Tactile mechanical keys',
          'Customizable RGB lighting',
          'Anti-ghosting technology',
          'Durable metal frame',
        ],
        specification: {
          'Switch Type': 'Mechanical',
          'Backlight': 'RGB',
          'Key Rollover': 'N-key',
          'Connection': 'Wired (USB)',
        },
      ),
      price: 35000,
      imageUrls: [
        'https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop',
      ],
      rating: 4.3,
      brandId: 'Havit',
      isFlashSale: false,
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

