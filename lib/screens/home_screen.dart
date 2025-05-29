import 'package:flutter/material.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/promomtional_card_grid.dart';
import 'package:jumia_clone/widgets/promotional_card_row.dart';

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
          ],
        ),
      ),
    );
  }
}
