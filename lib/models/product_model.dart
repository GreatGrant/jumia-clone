import '../core/util/product_tag.dart';

class ProductModel {
  final String id;
  final String title;
  final String? description;
  final List<String> imageUrls;
  final double price;
  final String brandId;

  final double? rating;
  final double? originalPrice;
  final double? discountPercentage;
  final int? itemsLeft;
  final int? totalUnits;
  final bool isOfficialStore;
  final ProductTag? label;
  final int? ratingCount;
  final double? ratingSum;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    required this.imageUrls,
    required this.price,
    required this.brandId,
    this.rating,
    this.originalPrice,
    this.discountPercentage,
    this.itemsLeft,
    this.totalUnits,
    required this.isOfficialStore,
    this.label,
    this.ratingCount,
    this.ratingSum,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'],
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      price: (json['price'] as num).toDouble(),
      brandId: json['brandId'],
      rating: json['rating']?.toDouble(),
      originalPrice: json['originalPrice']?.toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      itemsLeft: json['itemsLeft'],
      totalUnits: json['totalUnits'],
      isOfficialStore: json['isOfficialStore'] ?? false,
      label: json['label'] != null ? ProductTagSerialization.fromJson(json['label']) : null,
      ratingCount: json['ratingCount'],
      ratingSum: json['ratingSum']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'price': price,
      'brandId': brandId,
      'rating': rating,
      'originalPrice': originalPrice,
      'discountPercentage': discountPercentage,
      'itemsLeft': itemsLeft,
      'totalUnits': totalUnits,
      'isOfficialStore': isOfficialStore,
      'label': label?.toJson(),
      'ratingCount': ratingCount,
      'ratingSum': ratingSum,
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? imageUrls,
    double? price,
    String? brandId,
    double? rating,
    double? originalPrice,
    double? discountPercentage,
    int? itemsLeft,
    int? totalUnits,
    bool? isOfficialStore,
    ProductTag? label,
    int? ratingCount,
    double? ratingSum,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      brandId: brandId ?? this.brandId,
      rating: rating ?? this.rating,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      itemsLeft: itemsLeft ?? this.itemsLeft,
      totalUnits: totalUnits ?? this.totalUnits,
      isOfficialStore: isOfficialStore ?? this.isOfficialStore,
      label: label ?? this.label,
      ratingCount: ratingCount ?? this.ratingCount,
      ratingSum: ratingSum ?? this.ratingSum,
    );
  }
}