import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/models/product_model.dart';

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
              // Handle selected value
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
              PopupMenuItem(
                value: 'wishlist',
                child: Row(
                  children: [
                    Icon(Icons.favorite_outlined, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Wishlist'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'account',
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.black),
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
    );
  }
}
