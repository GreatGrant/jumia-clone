import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/menu_section.dart';
import 'package:jumia_clone/widgets/action_button.dart';
import 'package:jumia_clone/widgets/custom_appbar.dart';
import 'package:jumia_clone/widgets/menu_list.dart';

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
                    Icon(
                      Icons.more_horiz_outlined,
                      size: 12,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                text: 'Start Live Chat',
                onPressed: () => context.go('/live-chat'), // Updated
                backgroundColor: AppColors.primary,
              ),
              const SizedBox(height: 16),
              MenuSection(
                title: 'Need Assistance?',
                items: [
                  MenuListItem(
                    icon: Icons.info_outline,
                    title: 'Help & Support',
                    onTap: () => context.go('/help-and-support'), // Updated
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
                    onTap: () => context.push('/orders'),
                  ),
                  MenuListItem(
                    icon: Icons.email_outlined,
                    title: 'Inbox',
                    onTap: () => context.push('/inbox'),
                  ),
                  MenuListItem(
                    icon: Icons.rate_review_outlined,
                    title: 'Ratings & Reviews',
                    onTap: () => context.push('/ratings'),
                  ),
                  MenuListItem(
                    icon: Icons.local_offer_outlined,
                    title: 'Vouchers',
                    onTap: () => context.push('/vouchers'),
                  ),
                  MenuListItem(
                    icon: Icons.favorite_outline,
                    title: 'Wishlist',
                    onTap: () => context.push('/account-wishlist'),
                  ),
                  MenuListItem(
                    icon: Icons.store,
                    title: 'Follow Seller',
                    onTap: () => context.push('/follow-seller'),
                  ),
                  MenuListItem(
                    icon: Icons.history,
                    title: 'Recently Viewed',
                    onTap: () => context.push('/recently-viewed'),
                  ),
                  MenuListItem(
                    icon: Icons.search,
                    title: 'Recently Searched',
                    onTap: () => context.push('/recently-searched'),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              MenuSection(
                title: 'My Settings',
                items: [
                  MenuListItem(
                    title: 'Payment Settings',
                    onTap: () => context.push('/payment-settings'),
                  ),
                  MenuListItem(
                    title: 'Address Book',
                    onTap: () => context.push('/address-book'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}