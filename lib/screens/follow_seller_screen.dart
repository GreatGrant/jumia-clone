import 'package:flutter/material.dart';

class FollowSellerScreen extends StatelessWidget {
  const FollowSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Follow Seller')),
      body: const Center(child: Text('Followed Sellers')),
    );
  }
}

