import 'package:flutter/material.dart';

class VouchersScreen extends StatelessWidget {
  const VouchersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vouchers')),
      body: const Center(child: Text('Your Vouchers')),
    );
  }
}

