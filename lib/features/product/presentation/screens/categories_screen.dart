import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/core/theme/colors.dart';

import '../widgets/category_grid_section.dart';
import '../../data/models/product_category_item.dart';
import '../../../../shared/widgets/search_appbar.dart';
import '../widgets/category_sidebar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Row(
        children: [
          // Left Sidebar
          const CategorySidebar(),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Computers Section
                  CategoryGridSection(
                    title: 'Computers',
                    categories: [
                      ProductCategoryItem(
                        name: 'Desktops',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/34/1859882/1.jpg?5744',
                      ),
                      ProductCategoryItem(
                        name: 'Laptops',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/18/8631012/1.jpg?4404',
                      ),
                      ProductCategoryItem(
                        name: 'Monitors',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/82/6538631/1.jpg?2838',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Data Storage Section
                  CategoryGridSection(
                    title: 'Data Storage',
                    categories: [
                      ProductCategoryItem(
                        name: 'External Hard Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/06/4298651/1.jpg?7510',
                      ),
                      ProductCategoryItem(
                        name: 'USB Flash Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/41/8647051/1.jpg?8540',
                      ),
                      ProductCategoryItem(
                        name: 'External Solid State Drives',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/18/6539631/1.jpg?2838',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Antivirus & Security Section
                  CategoryGridSection(
                    title: 'Antivirus & Security',
                    categories: [
                      ProductCategoryItem(
                        name: 'Antivirus',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/345678/1.jpg?1234', // Replace with actual antivirus image URL
                      ),
                      ProductCategoryItem(
                        name: 'Internet Security',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/98/765432/1.jpg?5678', // Replace with actual security software image URL
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Printers Section
                  CategoryGridSection(
                    title: 'Printers',
                    categories: [
                      ProductCategoryItem(
                        name: 'Inkjet Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/11/111111/1.jpg?1111',
                      ),
                      ProductCategoryItem(
                        name: 'Laser Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/22/222222/1.jpg?2222',
                      ),
                      ProductCategoryItem(
                        name: 'Photo Printers',
                        imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/33/333333/1.jpg?3333',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}