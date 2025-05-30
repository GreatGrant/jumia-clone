import '../util/product_tag.dart';

class ProductModel {
  final String id;
  final String? title;
  final String? description;
  final List<String> imageUrls;
  final double? rating;
  final double price;
  final double? originalPrice;
  final double? discountPercentage;
  final int? itemsLeft;
  final int? totalUnits;
  final bool isOfficialStore;
  final ProductTag? label;

  /// Store total rating count and sum for dynamic calculation
  final int? ratingCount;
  final double? ratingSum;

  ProductModel({
    required this.id,
    required this.isOfficialStore,
    this.title,
    this.description,
    required this.imageUrls,
    this.rating,
    required this.price,
    this.originalPrice,
    this.discountPercentage,
    this.itemsLeft,
    this.totalUnits,
    this.ratingCount,
    this.ratingSum,
    this.label,
  });

  /// Creates a new instance with updated rating based on a new score
  ProductModel rateProduct(double newRating) {
    final newCount = (ratingCount ?? 0) + 1;
    final newSum = (ratingSum ?? 0) + newRating;
    final newAverage = newSum / newCount;

    return ProductModel(
      id: id,
      isOfficialStore: isOfficialStore,
      title: title,
      description: description,
      imageUrls: imageUrls,
      rating: newAverage,
      price: price,
      originalPrice: originalPrice,
      discountPercentage: discountPercentage,
      itemsLeft: itemsLeft,
      totalUnits: totalUnits,
      ratingCount: newCount,
      ratingSum: newSum,
      label: label,
    );
  }
}