import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumia_clone/screens/account_screen.dart';
import 'package:jumia_clone/theme/themes.dart';

import 'navigation/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Jumia Account',
      theme: AppTheme.theme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}