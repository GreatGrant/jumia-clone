
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentSettingsScreen extends StatelessWidget {
  const PaymentSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Settings')),
      body: const Center(child: Text('Manage Payment Methods')),
    );
  }
}
