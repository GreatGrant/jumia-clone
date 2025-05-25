import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumia_clone/screens/account_screen.dart';
import 'package:jumia_clone/theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumia Account',
      theme: AppTheme.theme,
      home: AccountScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}