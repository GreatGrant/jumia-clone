import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/info_banner.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F1F1),
        appBar: AccountAppBarWithContent(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              ActionButton(
                  icon: Icons.chat_bubble_outline,
                  text: 'Start Live Chat',
                  onPressed: () {
                    print('Live chat pressed');
                  },
                  backgroundColor: const Color(0xFFF68C1E),
                ),

              const SizedBox(height: 24),
      
              const SectionHeader(title: 'Need Assistance?'),
      
              MenuListItem(
                icon: Icons.info_outline,
                title: 'Help & Support',
                onTap: () {
                  print('Help & Support tapped');
                },
              ),
      
              const SizedBox(height: 24),
      
              const SectionHeader(title: 'My Jumia Account'),
      
              const SizedBox(height: 8),
      
              MenuListItem(
                icon: Icons.shopping_bag_outlined,
                title: 'Orders',
                onTap: () {
                  print('Orders tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.inbox_outlined,
                title: 'Inbox',
                onTap: () {
                  print('Inbox tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.rate_review_outlined,
                title: 'Ratings & Reviews',
                onTap: () {
                  print('Ratings & Reviews tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.local_offer_outlined,
                title: 'Vouchers',
                onTap: () {
                  print('Vouchers tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.favorite_outline,
                title: 'Wishlist',
                onTap: () {
                  print('Wishlist tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.person_add_outlined,
                title: 'Follow Seller',
                onTap: () {
                  print('Follow Seller tapped');
                },
              ),
      
              MenuListItem(
                icon: Icons.history,
                title: 'Recently Viewed',
                onTap: () {
                  print('Recently Viewed tapped');
                },
              ),
      
              const SizedBox(height: 100), // Bottom padding for navigation bar
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarCustom(
          currentIndex: 4,
          onTap: (index) {
            print('Bottom nav tapped: $index');
          },
        ),
      ),
    );
  }
}
