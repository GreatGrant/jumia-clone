import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: const Center(child: Text('Categories Screen')),
    );
  }
}