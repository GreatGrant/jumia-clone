import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/widgets/welcome_card.dart';

import '../main.dart';
import 'info_banner.dart';

class AccountAppBarWithContent extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBarWithContent({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(156);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2C2C2C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding for Account row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Account',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
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

          // For InfoBannerController, if you want same padding too:
          InfoBannerController(
            isLoggedIn: false,
            hasInternet: false,
            onTap: () {
              print('Banner tapped');
            },
          ),
        ],
      ),
    );
  }

}
