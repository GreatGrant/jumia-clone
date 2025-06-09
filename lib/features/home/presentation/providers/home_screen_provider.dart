import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jumia_clone/features/home/presentation/home_notifier.dart';
import 'package:jumia_clone/features/home/presentation/home_services.dart';
import 'package:jumia_clone/features/home/presentation/home_state.dart';
import 'package:jumia_clone/models/product_model.dart';

import '../../home_section_model.dart';
import '../../home_section_type.dart';


// Service Provider
final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService();
});


// Provider
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final homeService = ref.watch(homeServiceProvider);
  return HomeNotifier(homeService);
});

// Individual Section Provider
final sectionProvider = Provider.family<HomeSectionModel?, String>((ref, sectionId) {
  final homeState = ref.watch(homeProvider);
  return homeState.sections.firstWhere(
        (section) => section.id == sectionId,
    orElse: () => HomeSectionModel(id: sectionId, title: '', type: HomeSectionType.productRow),
  );
});

// Scroll Controller Provider
final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});