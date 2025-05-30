import 'package:flutter/material.dart';
import 'package:jumia_clone/screens/recently_viewed.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/util/product_tag.dart';
import 'package:jumia_clone/widgets/promomtional_card_grid.dart';
import 'package:jumia_clone/widgets/product_row_widget.dart';

import '../models/product_model.dart';
import '../util/product_tag.dart';
import '../widgets/flash_sales_header.dart';
import '../widgets/no_connection_widget.dart';
import '../widgets/promotional_card.dart';
import '../widgets/promotional_slider.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample promotional images - replace with your actual remote URLs
    final List<String> promoImages = [
      'https://ng.jumia.is/cms/0-6-anniversary/2025/Emoji-challenge/Desktop-Homepage-Slider_-712x384.gif',
      'https://ng.jumia.is/cms/0-6-anniversary/2025/Global-early-bird-deals/712X384_.jpg',
      'https://ng.jumia.is/cms/0-6-anniversary/2025/Flash-Sales/Desktop-Homepage-Slider_-712x384.gif',
      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Awoof-deals/May/AOTM_APRIL_MOTION_712x384.gif',
      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Week_22/Beauty_style/712X384.jpg',
      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Week_22/Children-s_Collection/712x384.gif',
    ];

    final List<ProductModel> productItems = [
      ProductModel(
        id: '1',
        isOfficialStore: true,
        title: 'Stainless Steel Cookware Set',
        description: '10-piece non-stick cookware set for versatile cooking',
        price: 42900,
        imageUrls: [
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=300&h=300&fit=crop',
        ],
        rating: 4.5,
        totalUnits: 25,
        itemsLeft: 10,
        ratingCount: 120,
        ratingSum: 540,
        // 4.5 * 120
        label: ProductTag.payOnDelivery(),
      ),
      ProductModel(
        id: '2',
        isOfficialStore: false,
        title: 'Ceramic Dinnerware Set',
        description: '16-piece dinnerware set with plates, bowls, and mugs',
        price: 15000,
        originalPrice: 25000,
        discountPercentage: 40,
        imageUrls: [
          'https://images.unsplash.com/photo-1556207425-8b6e903a79cd?w=300&h=300&fit=crop',
        ],
        rating: 4.2,
        totalUnits: 30,
        itemsLeft: 10,
        ratingCount: 85,
        ratingSum: 357,
        // 4.2 * 85
        label: ProductTag.nonReturnable(),
      ),
      ProductModel(
        id: '3',
        isOfficialStore: false,
        title: 'Electric Kettle',
        description: '1.7L stainless steel kettle with fast boil',
        price: 18500,
        originalPrice: 22000,
        discountPercentage: 16,
        imageUrls: [
          'https://images.unsplash.com/photo-1602144169241-2c6b6e2e65fd?w=300&h=300&fit=crop',
        ],
        rating: 4.7,
        totalUnits: 35,
        itemsLeft: 9,
        ratingCount: 200,
        ratingSum: 940, // 4.7 * 200
      ),
      ProductModel(
        id: '4',
        isOfficialStore: true,
        title: 'Blender with Glass Jar',
        description: 'High-power blender for smoothies and food prep',
        price: 35000,
        imageUrls: [
          'https://images.unsplash.com/photo-1585238333964-2d4b3f094ebb?w=300&h=300&fit=crop',
        ],
        rating: 4.3,
        totalUnits: 55,
        itemsLeft: 49,
        ratingCount: 150,
        ratingSum: 645,
        // 4.3 * 150
        label: ProductTag.payOnDelivery(),
      ),
    ];

    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 57,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFF6AC1D5)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: const Text(
                'CALL TO ORDER: 07006000000,\n02018883300',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            PromoSlider(imageUrls: promoImages),
            SizedBox(height: 8),
            PromotionalCardGrid(
              cards: [
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Awoof-deals/Aotm-Logo.png',
                  label: 'Awoof',
                  backgroundColor: AppColors.primary, // Orange background
                  onTap: () {
                    print('Awoof tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/electronics.png',
                  label: 'Appliances',
                  backgroundColor: AppColors.primary,
                  onTap: () {
                    print('Appliances tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/BUY-2_updated.gif',
                  label: 'Up to 80% Off',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Up to 80% Off tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/phones.png',
                  label: 'Phones & Tablets',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            PromotionalCardGrid(
              cards: [
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/BUY-2_updated.gif',
                  label: 'Up to 50% Off',
                  backgroundColor: AppColors.primary, // Orange background
                  onTap: () {
                    print('Up to 50% Off tapped');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/electronics.png',
                  label: 'TV & Audio Deals',
                  backgroundColor: AppColors.primary,
                  onTap: () {
                    print('TV & Audio Deals tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/beauty.png',
                  label: 'Beauty Must Have',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Beauty Must Have tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/Jumia-delivery/300X300.png',
                  label: 'Send Packages Securely',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/jumia-global/2025/buy-2-get-850-off/Buy-2-items.gif',
                  label: 'Buy 2, Get ₦850 Off',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/fashion.png',
                  label: 'Fashion deals',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/home.jpg',
                  label: 'Earn While You Shop',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/0-Seller/BANGER-DEALS.gif',
                  label: 'Up to 60% Off',
                  backgroundColor: Colors.grey[200]!,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
              ],
            ),
            FlashSaleHeader(timeLeft: '16h:58m:23s'),
            ProductRowWidget(
              items: productItems,
              showStock: true,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
