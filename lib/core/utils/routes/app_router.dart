import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/product/data/models/product_model.dart';
import '../../../features/product/presentation/screens/details_sreen.dart';
import '../../../features/account/presentation/screens/account_screen.dart';
import '../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../features/product/presentation/screens/categories_screen.dart';
import '../../../screens/follow_seller_screen.dart';
import '../../../features/product/presentation/screens/home_screen.dart';
import '../../../screens/inbox_screen.dart';
import '../../../main_screen.dart';
import '../../../screens/orders_screen.dart';
import '../../../screens/project_setting_screen.dart';
import '../../../screens/rating_screen.dart';
import '../../../screens/recently_searched_screen.dart';
import '../../../screens/recently_viewed.dart';
import '../../../screens/vouchers_screen.dart';
import '../../../screens/wish_list_screen.dart';
import '../../../screens/live_chat_screen.dart'; // Add this
import '../../../screens/help_and_support_screen.dart'; // Add this

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    // Shell route for tabs with bottom navigation bar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/categories',
              builder: (context, state) => const CategoriesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cart',
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/wishlist',
              builder: (context, state) => const WishlistScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              builder: (context, state) => const AccountScreen(),
            ),
          ],
        ),
      ],
    ),

    // Full-screen routes for Account sub-screens (no bottom nav)
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/inbox',
      builder: (context, state) => const InboxScreen(),
    ),
    GoRoute(
      path: '/ratings',
      builder: (context, state) => const RatingsScreen(),
    ),
    GoRoute(
      path: '/vouchers',
      builder: (context, state) => const VouchersScreen(),
    ),
    GoRoute(
      path: '/account-wishlist',
      builder: (context, state) => const WishlistScreen(),
    ),
    GoRoute(
      path: '/follow-seller',
      builder: (context, state) => const FollowSellerScreen(),
    ),
    GoRoute(
      path: '/recently-viewed',
      builder: (context, state) => const RecentlyViewedScreen(),
    ),
    GoRoute(
      path: '/recently-searched',
      builder: (context, state) => const RecentlySearchedScreen(),
    ),
    GoRoute(
      path: '/payment-settings',
      builder: (context, state) => const PaymentSettingsScreen(),
    ),
    GoRoute(
      path: '/address-book',
      builder: (context, state) => const AddressBookScreen(),
    ),
    GoRoute(
      path: '/live-chat',
      builder: (context, state) => const LiveChatScreen(),
    ),
    GoRoute(
      path: '/help-and-support',
      builder: (context, state) => const HelpAndSupportScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return DetailsScreen(product: product);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Error: ${state.error}')),
  ),
);