import 'package:flutter/material.dart';
import 'package:jumia_clone/screens/recently_viewed.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/util/product_tag.dart';
import 'package:jumia_clone/widgets/promomtional_card_grid.dart';
import 'package:jumia_clone/widgets/product_row_widget.dart';

import '../models/product_model.dart';
import '../util/product_tag.dart';
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
          'https://images.unsplash.com/photo-1588279102567-67db026f11c0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fENPT0tXQVJFJTIwU0VUfGVufDB8fDB8fHww',
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
          'https://images.unsplash.com/photo-1599958681123-88cd5957db83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2VyYW1pYyUyMGRpbm5lcndhcmV8ZW58MHx8MHx8fDA%3D',
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
          'https://media.istockphoto.com/id/1571815108/photo/close-up-shot-of-an-unrecognisable-woman-using-kettle-in-kitchen.jpg?s=1024x1024&w=is&k=20&c=Sx7l5iHqlUsDCNN4ix1p7acB73u4SR8Dz4E9nfq0rTU=',
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
          'https://images.unsplash.com/photo-1570222094114-d054a817e56b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QkxFTkRFUnxlbnwwfHwwfHx8MA%3D%3D',
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

    final List<ProductModel> sponsoredProducts = [
      ProductModel(
        id: '1',
        isOfficialStore: true,
        title: 'Stainless Steel Cookware Set',
        description: '10-piece non-stick cookware set for versatile cooking',
        price: 42900,
        imageUrls: [
          'https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_1280.jpg',
          'https://picsum.photos/300/300?random=1',
        ],
        rating: 4.5,
        totalUnits: 25,
        itemsLeft: 10,
        ratingCount: 120,
        ratingSum: 540,
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzdyvmk7BrT2EuuPhzznwPmgThpoAxH700Og&s',
          'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg',
        ],
        rating: 4.2,
        totalUnits: 30,
        itemsLeft: 10,
        ratingCount: 85,
        ratingSum: 357,
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
          'https://images.unsplash.com/photo-1571552879083-e93b6ea70d1d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8RUxFQ1RSSUMlMjBLRVRUTEV8ZW58MHx8MHx8fDA%3D',
          'https://images.unsplash.com/photo-1579752898926-3bcbc125ae2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fEVMRUNUUklDJTIwS0VUVExFfGVufDB8fDB8fHww',
        ],
        rating: 4.7,
        totalUnits: 35,
        itemsLeft: 9,
        ratingCount: 200,
        ratingSum: 940,
      ),
      ProductModel(
        id: '4',
        isOfficialStore: true,
        title: 'Blender with Glass Jar',
        description: 'High-power blender for smoothies and food prep',
        price: 35000,
        imageUrls: [
          'https://plus.unsplash.com/premium_photo-1681826671576-8d612accc77a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D'
          'https://cdn.pixabay.com/photo/2017/05/11/19/44/fresh-fruits-2305192_1280.jpg',
        ],
        rating: 4.3,
        totalUnits: 55,
        itemsLeft: 49,
        ratingCount: 150,
        ratingSum: 645,
        label: ProductTag.payOnDelivery(),
      ),
    ];

    final List<ProductModel> electronics = [
      ProductModel(
        id: '1',
        isOfficialStore: false,
        title: 'Logitech H390 USB Headset',
        description: 'High-quality USB headset with noise-canceling microphone',
        price: 42900,
        imageUrls: ['https://images.unsplash.com/photo-1599669454699-248893623440?w=300&h=300&fit=crop'],
        rating: 4.5,
      ),
      ProductModel(
        id: '2',
        isOfficialStore: false,
        title: 'Havit PC Gaming Cursor',
        description: 'Gaming headset with RGB lighting and surround sound',
        price: 15000,
        originalPrice: 25000,
        discountPercentage: 40,
        imageUrls: ['https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=300&h=300&fit=crop'],
        rating: 4.2,
        itemsLeft: 25,
      ),
      ProductModel(
        id: '3',
        isOfficialStore: false,
        title: 'Wireless Gaming Mouse',
        description: 'High precision wireless gaming mouse with RGB',
        price: 18500,
        originalPrice: 22000,
        discountPercentage: 16,
        imageUrls: ['https://images.unsplash.com/photo-1527814050087-3793815479db?w=300&h=300&fit=crop'],
        rating: 4.7,
        itemsLeft: 12,
      ),
      ProductModel(
        id: '4',
        isOfficialStore: false,
        title: 'Mechanical Keyboard RGB',
        description: 'Gaming keyboard with mechanical switches',
        price: 35000,
        imageUrls: ['https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop'],
        rating: 4.3,
      ),
    ];

    final List<ProductModel> xiaomiOfficialStoreItems = [
      ProductModel(
        id: '101',
        isOfficialStore: true,
        title: 'Xiaomi Redmi Note 13 Pro',
        description: '6.67" AMOLED, 8GB RAM, 256GB ROM, 5000mAh Battery',
        price: 189000,
        originalPrice: 210000,
        discountPercentage: 10,
        imageUrls: [
          'https://i01.appmifile.com/webfile/globalimg/in/cms/Redmi_Note_13_Pro_5G_Black.png',
        ],
        rating: 4.8,
        itemsLeft: 14,
      ),
      ProductModel(
        id: '102',
        isOfficialStore: true,
        title: 'Xiaomi Smart Band 8',
        description: 'Fitness tracker with 1.62" AMOLED display, 16-day battery',
        price: 23000,
        imageUrls: [
          'https://i01.appmifile.com/webfile/globalimg/in/cms/Mi_Band_8_Black.png',
        ],
        rating: 4.6,
      ),
      ProductModel(
        id: '103',
        isOfficialStore: true,
        title: 'Xiaomi Robot Vacuum Mop 2 Pro',
        description: 'High-efficiency cleaning with smart navigation and mopping',
        price: 179000,
        originalPrice: 200000,
        discountPercentage: 11,
        imageUrls: [
          'https://i01.appmifile.com/webfile/globalimg/in/cms/Robot_Vacuum_Mop_2_Pro_White.png',
        ],
        rating: 4.5,
        itemsLeft: 8,
      ),
      ProductModel(
        id: '104',
        isOfficialStore: true,
        title: 'Xiaomi TV Box S 2nd Gen',
        description: '4K Ultra HD, Dolby Audio, Google TV',
        price: 45000,
        imageUrls: [
          'https://i01.appmifile.com/webfile/globalimg/in/cms/TV_Box_S_2nd_Gen_Black.png',
        ],
        rating: 4.4,
        itemsLeft: 20,
      ),
    ];

    final List<ProductModel> phonesAndTablet = [
      ProductModel(
        id: '201',
        isOfficialStore: true,
        title: 'Samsung Galaxy A54 5G',
        description: '6.4" Super AMOLED, 8GB RAM, 128GB ROM, 5000mAh Battery',
        price: 295000,
        originalPrice: 320000,
        discountPercentage: 8,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/28/2223353/1.jpg?3444',
        ],
        rating: 4.7,
        itemsLeft: 10,
      ),
      ProductModel(
        id: '202',
        isOfficialStore: true,
        title: 'Oraimo FreePods 3',
        description: 'True Wireless Earbuds with Noise Cancellation, 20-hour playtime',
        price: 25000,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/56/6975982/1.jpg?4201',
        ],
        rating: 4.5,
      ),
      ProductModel(
        id: '203',
        isOfficialStore: true,
        title: 'Infinix Smart 7',
        description: '6.6" HD+ Display, 4GB RAM, 64GB ROM, 5000mAh Battery',
        price: 85000,
        originalPrice: 95000,
        discountPercentage: 10,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/39/8857604/1.jpg?8011',
        ],
        rating: 4.3,
        itemsLeft: 15,
      ),
      ProductModel(
        id: '204',
        isOfficialStore: true,
        title: 'Philips Air Fryer HD9252/90',
        description: '4.1L Capacity, Rapid Air Technology, Digital Display',
        price: 120000,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/40/0629883/1.jpg?6147',
        ],
        rating: 4.6,
        itemsLeft: 5,
      ),
    ];

    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BannerHeaderWidget(title: 'CALL TO ORDER: 07006000000, 02018883300'),
            PromoSlider(imageUrls: promoImages),
            SizedBox(height: 8),
            PromotionalCardGrid(
              cards: [
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Awoof-deals/Aotm-Logo.png',
                  label: 'Awoof',
                  backgroundColor: AppColors.primary,
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
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Up to 80% Off tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/phones.png',
                  label: 'Phones & Tablets',
                  backgroundColor: AppColors.lightGrey,
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
                  backgroundColor: AppColors.primary,
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
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Beauty Must Have tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/Jumia-delivery/300X300.png',
                  label: 'Send Packages Securely',
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-initiatives/jumia-global/2025/buy-2-get-850-off/Buy-2-items.gif',
                  label: 'Buy 2, Get ₦850 Off',
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/fashion.png',
                  label: 'Fashion deals',
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/home.jpg',
                  label: 'Earn While You Shop',
                  backgroundColor: AppColors.lightGrey,
                  onTap: () {
                    print('Phones & Tablets tapped!');
                  },
                ),
                PromotionalCard(
                  imagePath:
                      'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/0-Seller/BANGER-DEALS.gif',
                  label: 'Up to 60% Off',
                  backgroundColor: AppColors.lightGrey,
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
            SizedBox(height: 8),
            ProductRowWidget(
              items: sponsoredProducts,
              title: "Sponsored Products",
              showStock: false,
              showLabel: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showRating: false,
              showFavoriteIcon: false,
              onItemTap: (item) {
                print('Tapped on ${item.title}');
              },
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Top Sellers'),
            ProductRowWidget(
              items: productItems,
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
              items: productItems,
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
              items: phonesAndTablet,
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
              items: productItems,
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
              items: productItems,
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
              items: electronics,
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
              items: productItems,
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
              items: xiaomiOfficialStoreItems,
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
              items: productItems,
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
              items: productItems,
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
              items: productItems,
              showStock: false,
              showLabel: false,
              showRating: false,
              showOfficialStoreLabel: false,
              showAddToCart: false,
              showFavoriteIcon: false,
            ),
            SizedBox(height: 8),
            BannerHeaderWidget(title: 'Anniversary Deals on Beauty\nProducts', onSeeAllTap: (){},),
            ProductRowWidget(
              items: productItems,
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
              items: productItems,
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
              items: productItems,
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
              items: productItems,
              showStock: false,
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
