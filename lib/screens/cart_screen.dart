import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/no_connection_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 46, 0, 8),
            child: NoConnectionWidget(onRetry: (){}),
          )
        ],
      ),
    );
  }
}

