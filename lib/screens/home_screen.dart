import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/jumia_data.dart';
import 'package:jumia_clone/screens/recently_viewed.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/core/util/product_tag.dart';
import 'package:jumia_clone/widgets/promomtional_card_grid.dart';
import 'package:jumia_clone/widgets/product_row_widget.dart';
import 'package:jumia_clone/widgets/top_selling_grid_section.dart';

import '../models/product_model.dart';
import '../core/util/product_tag.dart';
import '../widgets/banner_widget.dart';
import '../widgets/flash_sales_header.dart';
import '../widgets/no_connection_widget.dart';
import '../widgets/promotional_card.dart';
import '../widgets/promotional_slider.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BannerHeaderWidget(title: 'CALL TO ORDER: 07006000000, 02018883300'),
            PromoSlider(imageUrls: JumiaData.promoImages),
            SizedBox(height: 8),
            PromotionalCardGrid(
              cards: [
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Awoof-deals/Aotm-Logo.png',
                  label: 'Awoof',
                  backgroundColor: AppColors.primary,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/electronics.png',
                  label: 'Appliances',
                  backgroundColor: AppColors.primary,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/BUY-2_updated.gif',
                  label: 'Up to 80% Off',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/phones.png',
                  label: 'Phones & Tablets',
                  backgroundColor: AppColors.lightGrey,
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
                  backgroundColor: AppColors.primary,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/electronics.png',
                  label: 'TV & Audio Deals',
                  backgroundColor: AppColors.primary,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/beauty.png',
                  label: 'Beauty Must Have',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/Jumia-delivery/300X300.png',
                  label: 'Send Packages Securely',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/jumia-global/2025/buy-2-get-850-off/Buy-2-items.gif',
                  label: 'Buy 2, Get ₦850 Off',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/fashion.png',
                  label: 'Fashion deals',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/home.jpg',
                  label: 'Earn While You Shop',
                  backgroundColor: AppColors.lightGrey,
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/0-Seller/BANGER-DEALS.gif',
                  label: 'Up to 60% Off',
                  backgroundColor: AppColors.lightGrey,
                ),
              ],
            ),
            FlashSaleHeader(timeLeft: '16h:58m:23s'),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: true,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            ProductRowWidget(
              items: JumiaData.sponsoredProducts,
              title: "Sponsored Products",
              showStock: false,
              showLabel: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showRating: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Top Sellers'),
            ProductRowWidget(
              items: JumiaData.electronics,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Nivea Official Store', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.niveaOfficialStoreItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Phones & Tablets', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.phonesAndTablet,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Fashion', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.anniversaryDeals,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Appliances', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.electronics,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals for Your Home', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.anniversaryDeals,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Everything Must Go', subtitle: 'Up to 60% OFF', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Itel Official Store', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.jumiaTopSellersItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Electronics', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.electronics,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Celebrations', subtitle: 'Enjoyment Overload', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Xiaomi Official Store', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.xiaomiOfficialStoreItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Defacto Official Store', subtitle: '30% off at checkout when you buy 2+', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Fashion', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on TVs', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Beauty Products', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.niveaOfficialStoreItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Computing', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'From Casual to Formal', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Handpicked for you', subtitle: 'Up to 50% Off', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Half Price Store', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Jumia Bar', onSeeAllTap: (){},),
            ProductRowWidget(
              items: JumiaData.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            TopSellingGridSection(products: JumiaData.productItems)
          ],
        ),
      ),
    );
  }
}
