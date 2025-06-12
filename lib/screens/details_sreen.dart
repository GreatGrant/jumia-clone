import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/jumia_data.dart';
import 'package:jumia_clone/models/product_model.dart';
import 'package:jumia_clone/widgets/jumia_appbar.dart';
import 'package:jumia_clone/widgets/product_details_widget.dart';
import 'package:jumia_clone/widgets/strike_through_price.dart';

import '../core/util/format_time.dart';
import '../theme/colors.dart';
import '../widgets/custom_progress_bar.dart';
import '../widgets/delivery_returns_info.dart';
import '../widgets/discount_badge.dart';
import '../widgets/flipped_icon_offer.dart';
import '../widgets/persistent_footer_widget.dart';
import '../widgets/product_label_badge.dart';
import '../widgets/product_rating_reviews.dart';
import '../widgets/products_rating_display.dart';
import '../widgets/promotions_widget.dart';
import '../widgets/section_header.dart';

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
    bool isFlashSale = widget.product.isFlashSale;

    return Scaffold(
      appBar: JumiaAppBar(title: 'Details'),
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
                        Icons.shopping_cart,
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.label != null)
                      ProductLabelBadge(label: widget.product.label!),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 8),

                    // Brand
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Brand: ',
                            style: TextStyle(color: AppColors.black, fontSize: 14),
                          ),
                          TextSpan(
                            text: widget.product.brandId,
                            style: TextStyle(
                              color: AppColors.deepBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                            ' | ',
                            style: TextStyle(color: AppColors.black, fontSize: 12),
                          ),
                          TextSpan(
                            text:
                            'Similar products from ${widget.product.brandId}',
                            style: TextStyle(color: AppColors.deepBlue, fontSize: 12, fontWeight: FontWeight.w600,),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Flash Sales (conditional)
                    if (isFlashSale) ...[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            // Entire Flash Sale Section Container
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Flash Sale Header
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            FlippedOfferIcon(
                                              size: 24,
                                              baseColor: AppColors.amber,
                                              flashColor: AppColors.red,
                                            ),
                                            const SizedBox(width: 4),
                                            const Text(
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
                                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
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
                                                fontWeight: FontWeight.w900,
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
                                                  fontSize: 12,
                                                  color: AppColors.grey,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: CustomProgressBar(
                                                  progressValue: widget.product.itemsLeft!.toDouble(),
                                                  totalValue: widget.product.totalUnits!.toDouble(),
                                                  progressColor: Colors.red,
                                                  backgroundColor: Colors.grey[200]!,
                                                  height: 8,
                                                  borderRadius: 4,
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
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                          ),
                          if (widget.product.originalPrice != null) ...[
                            const SizedBox(width: 12),
                            StrikethroughPrice(price: widget.product.originalPrice!, fontSize: 14,),
                            const SizedBox(width: 8),
                            if (widget.product.discountPercentage != null)
                              DiscountBadge(discount: widget.product.discountPercentage!)
                          ],
                        ],
                      ),
                    ],
                    if (!isFlashSale) ...[
                      Text(
                        widget.product.stockStatus,
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: '+ shipping from ₦${widget.product.shippingFee?.toStringAsFixed(0)} to LEKKI-AJAH (SANGOTEDO) ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'See options',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.deepBlue,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ]
                        )
                    ),
                    // Rating Section (Optional)
                    if (widget.product.rating != null) ...[
                      const SizedBox(height: 4),
                      ProductRatingDisplay(
                        rating: widget.product.rating!,
                        ratingCount: widget.product.ratingCount ?? 0,
                      ),

                  ],
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            PromotionsWidget(promotions: JumiaData.promotions),
            SizedBox(height: 12,),
            DeliveryReturnsInfo(
              locations: JumiaData.sampleLocations,
              currency: '₦',
              onDetailsPressed: () {
                print('Details pressed');
              },
            ),
            SizedBox(height: 12,),
            ProductDetailsWidget(details: widget.product.productDetails!.keyFeatures!),
            SizedBox(height: 12,),
            ProductRatingReviews(
              overallRating: widget.product.rating ?? 0.0,
              totalRatings: widget.product.ratingCount ?? 0,
              reviews: widget.product.reviews ?? [],
              onViewAllReviews: () {
                print('View all reviews tapped');
              },
            ),
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