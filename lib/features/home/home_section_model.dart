import '../../models/product_model.dart';
import 'presentation/providers/home_screen_provider.dart';
import 'home_section_type.dart';

class HomeSectionModel {
  final String id;
  final String title;
  final String? subtitle;
  final HomeSectionType type;
  final List<ProductModel> products;
  final bool isLoaded;
  final bool isLoading;
  final String? error;

  const HomeSectionModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.type,
    this.products = const [],
    this.isLoaded = false,
    this.isLoading = false,
    this.error,
  });

  HomeSectionModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    HomeSectionType? type,
    List<ProductModel>? products,
    bool? isLoaded,
    bool? isLoading,
    String? error,
  }) {
    return HomeSectionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      products: products ?? this.products,
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
