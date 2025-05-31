import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_nav.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default back button from exiting
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // If not on HomeScreen (index 0), switch to HomeScreen
          if (navigationShell.currentIndex != 0) {
            navigationShell.goBranch(0); // Navigate to /home
          } else {
            // On HomeScreen, allow app to exit
            SystemNavigator.pop();
      }
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBarCustom(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(index);
          },
        ),
      ),
    );
  }
}