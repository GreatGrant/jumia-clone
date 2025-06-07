import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/models/product_model.dart';

import '../core/util/format_time.dart';
import '../theme/colors.dart';
import '../widgets/persistent_footer_widget.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentImageIndex = 0;
  final Duration _timeLeft = const Duration(hours: 1, minutes: 30, seconds: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Assume isFlashSale based on discountPercentage or label for demo purposes
    bool isFlashSale = widget.product.discountPercentage != null &&
        widget.product.discountPercentage! > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              context.go('/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              context.go('/cart');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'home':
                  context.go('/home');
                  break;
                case 'categories':
                  context.go('/categories');
                  break;
                case 'cart':
                  context.go('/cart');
                  break;
                case 'wishlist':
                  context.go('/wishlist');
                  break;
                case 'account':
                  context.go('/account');
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'home',
                child: Row(
                  children: [
                    Icon(Icons.home_outlined, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Home'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'categories',
                child: Row(
                  children: [
                    Icon(Icons.view_list_outlined, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Categories'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'cart',
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Cart'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'wishlist',
                child: Row(
                  children: [
                    Icon(Icons.favorite_outline, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Wishlist'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'account',
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Account'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: widget.product.imageUrls.length,
              options: CarouselOptions(
                height: 325,
                enableInfiniteScroll: true,
                viewportFraction: 0.85,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  color: AppColors.surface,
                  margin: const EdgeInsets.fromLTRB(0,  0, 8, 8 ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.imageUrls[index],
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.broken_image,
                        size: 100,
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.label != null)
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          padding: widget.product.label!.padding,
                          decoration: BoxDecoration(
                            color: widget.product.label!.backgroundColor,
                            borderRadius: widget.product.label!.borderRadius,
                          ),
                          child: Text(
                            widget.product.label!.label,
                            style: TextStyle(
                              color: widget.product.label!.textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                    // Product Title
                    Text(
                      widget.product.title ?? 'Unnamed Product',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Brand (placeholder, as brand is not in ProductModel)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Brand: ',
                            style: TextStyle(color: Colors.blue[600], fontSize: 14),
                          ),
                          TextSpan(
                            text: widget.product.brandId,
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                            ' | Similar products from ${widget.product.isOfficialStore ? "Official Store" : "Generic"}',
                            style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Flash Sales (conditional)
                    if (isFlashSale) ...[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            // Flash Sale Header
                            Container(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.flash_on,
                                          color: Colors.yellow, size: 20),
                                      SizedBox(width: 4),
                                      Text(
                                        'Flash Sales',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Time Left ${formatTime(_timeLeft)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Price Section
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '₦ ${widget.product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      if (widget.product.originalPrice != null) ...[
                                        const SizedBox(width: 12),
                                        Text(
                                          '₦ ${widget.product.originalPrice!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '-${widget.product.discountPercentage?.toStringAsFixed(0)}%',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.orange[600],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  if (widget.product.itemsLeft != null) ...[
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          '${widget.product.itemsLeft} items left',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: LinearProgressIndicator(
                                            value: widget.product.itemsLeft! /
                                                (widget.product.totalUnits ?? 100),
                                            backgroundColor: Colors.grey[300],
                                            valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.orange),
                                            minHeight: 6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Regular Pricing
                    if (!isFlashSale) ...[
                      Row(
                        children: [
                          Text(
                            '₦ ${widget.product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          if (widget.product.originalPrice != null &&
                              widget.product.discountPercentage != null) ...[
                            const SizedBox(width: 12),
                            Text(
                              '₦ ${widget.product.originalPrice!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '-${widget.product.discountPercentage!.toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Description
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.product.description ?? 'No description available',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),

                    // Rating Section (Optional)
                    if (widget.product.rating != null) ...[
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Rating: ${widget.product.rating!.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(${widget.product.ratingCount ?? 0} reviews)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: PersistentFooterWidget(
        onHomePressed: () {
          context.go('/home');
        },
        onCallPressed: () {
          // Implement call functionality or navigate to contact page
          print('Call pressed');
        },
        onAddToCartPressed: () {
          // Implement add to cart logic
          print('Add to cart pressed');
        },
      ),
    );
  }
}