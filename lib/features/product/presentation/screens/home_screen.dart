import 'package:flutter/material.dart';
import 'package:jumia_clone/jumia_datasource.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import 'package:jumia_clone/features/product/presentation/widgets/top_selling_grid_section.dart';

import '../widgets/banner_widget.dart';
import '../../../../shared/widgets/search_appbar.dart';
import '../widgets/flash_sales_header.dart';
import '../../../../shared/widgets/product_row_widget.dart';
import '../widgets/promomotional_card_grid.dart';
import '../widgets/promotional_card.dart';
import '../widgets/promotional_slider.dart';

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
            PromoSlider(imageUrls: JumiaDataSource.promoImages),
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
              items: JumiaDataSource.productItems,
              showStock: true,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            ProductRowWidget(
              items: JumiaDataSource.sponsoredProducts,
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
              items: JumiaDataSource.electronics,
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
              items: JumiaDataSource.niveaOfficialStoreItems,
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
              items: JumiaDataSource.phonesAndTablet,
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
              items: JumiaDataSource.anniversaryDeals,
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
              items: JumiaDataSource.electronics,
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
              items: JumiaDataSource.anniversaryDeals,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.jumiaTopSellersItems,
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
              items: JumiaDataSource.electronics,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.xiaomiOfficialStoreItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.niveaOfficialStoreItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
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
              items: JumiaDataSource.productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            TopSellingGridSection(products: JumiaDataSource.productItems)
          ],
        ),
      ),
    );
  }
}
