import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/products_section_header.dart';

class FullProductDetailsScreen extends StatelessWidget {
  final List<String> details;

  const FullProductDetailsScreen({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductSectionHeader(
                title: "Complete Product Details",
                showIcon: false,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(top: 8, right: 12),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              details[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
