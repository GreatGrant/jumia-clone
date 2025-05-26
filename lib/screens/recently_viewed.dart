import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentlyViewedScreen extends StatelessWidget {
  const RecentlyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recently Viewed')),
      body: const Center(child: Text('Recently Viewed Items')),
    );
  }
}

