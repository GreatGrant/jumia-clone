import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/widgets/menu_section.dart';

import '../main.dart';
import '../widgets/action_button.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/info_banner.dart';
import '../widgets/menu_list.dart';
import '../widgets/section_header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AccountAppBarWithContent(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ActionButton(
                icon: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(Icons.chat_bubble, size: 24),
                    Icon(Icons.more_horiz_outlined, size: 12, color: Color(0xFFF68C1E),), // Smaller and centered
                  ],
                ),
                text: 'Start Live Chat',
                onPressed: () => print('Chat pressed'),
                backgroundColor: Color(0xFFF68C1E),
              ),

              const SizedBox(height: 16),

              MenuSection(
                title: 'Need Assistance?',
                items: [
                  MenuListItem(
                    icon: Icons.info_outline,
                    title: 'Help & Support',
                    onTap: () => print('Tapped'),
                  ),
                ],
              ),

              const SizedBox(height: 1),
      
              MenuSection(
                title: 'My Jumia Account',
                items: [
                  MenuListItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Orders',
                    onTap: () {
                      print('Orders tapped');
                    },
                  ),
                  MenuListItem(
                    icon: Icons.email_outlined,
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
                    icon: Icons.store,
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
                  MenuListItem(
                    icon: Icons.search,
                    title: 'Recently Searched',
                    onTap: () {
                      print('Recently Viewed tapped');
                    },
                  ),
                ]
              ),

              const SizedBox(height: 1),

          MenuSection(
            title: 'My Settings',
            items: [
              MenuListItem(
                title: 'Payment Settings',
                onTap: () {

                },
              ),
              MenuListItem(
                title: 'Address Book',
                onTap: () {

                },
              ),

            ]
          ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("Login", style: Theme.of(context).textTheme.labelLarge,)],
                ),
              )
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
