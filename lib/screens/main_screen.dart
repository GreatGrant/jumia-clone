import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_nav.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBarCustom(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
      ),
    );
  }
}