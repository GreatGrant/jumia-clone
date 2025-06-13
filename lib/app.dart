import 'package:flutter/cupertino.dart';
import 'core/utils/routes/app_router.dart';
import 'package:jumia_clone/core/theme/themes.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({super.key});

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