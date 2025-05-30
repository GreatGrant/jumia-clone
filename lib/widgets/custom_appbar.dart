import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/widgets/welcome_card.dart';

import '../main.dart';
import '../theme/colors.dart';
import 'info_banner.dart';

class AccountAppBarWithContent extends StatefulWidget implements PreferredSizeWidget {
  final bool isLoggedIn;
  final bool hasInternet;

  const AccountAppBarWithContent({
    super.key,
    this.isLoggedIn = false,
    this.hasInternet = false,
  });

  @override
  State<AccountAppBarWithContent> createState() => _AccountAppBarWithContentState();

  @override
  Size get preferredSize {
    // Base height: Account row (~50) + WelcomeCard (~70) + spacers (12 + 12 = 24)
    const double baseHeight = 50 + 70 + 24;
    // Add InfoBanner height (~36) if visible (i.e., !isLoggedIn || !hasInternet)
    const double infoBannerHeight = 36;
    final double totalHeight = baseHeight + ((isLoggedIn && hasInternet) ? 0 : infoBannerHeight);
    return Size.fromHeight(totalHeight);
  }
}

class _AccountAppBarWithContentState extends State<AccountAppBarWithContent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282828),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink to fit content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding for Account row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Account',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: AppColors.surface),
                  onPressed: () {
                    print('Search pressed');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Padding for WelcomeCard to match Account row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: WelcomeCard(
              title: 'Welcome',
              subtitle: 'Enter your account',
              buttonText: 'Login',
              onButtonPressed: () {
                print('Login pressed');
              },
            ),
          ),
          const SizedBox(height: 12),
          // InfoBannerController with same padding as others
          InfoBannerController(
            isLoggedIn: widget.isLoggedIn,
            hasInternet: widget.hasInternet,
            onTap: () {
              print('Banner tapped');
            },
          ),
        ],
      ),
    );
  }
}