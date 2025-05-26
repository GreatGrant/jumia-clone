import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ratings & Reviews')),
      body: const Center(child: Text('Your Ratings & Reviews')),
    );
  }
}

