import 'package:flutter/material.dart';

import '../widgets/no_connection_widget.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 46, 0, 8),
            child: NoConnectionWidget(onRetry: (){}),
          )
        ],
      ),
    );
  }
}
