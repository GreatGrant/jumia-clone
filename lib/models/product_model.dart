import 'package:jumia_clone/models/product_details_model.dart';
import 'package:jumia_clone/models/product_variant.dart';
import 'package:jumia_clone/models/review_model.dart';
import '../core/util/product_tag.dart';

class ProductModel {
  final String id;
  final String title;
  final ProductDetails? productDetails;
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
  final List<ReviewModel>? reviews;
  final bool isFlashSale;

  final List<ProductVariant>? variants;
  final double? shippingFee;

  ProductModel({
    required this.id,
    required this.title,
    this.productDetails,
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
    this.reviews,
    required this.isFlashSale,
    this.variants,
    this.shippingFee = 750,
  });

  String get stockStatus {
    final left = itemsLeft ?? 0;

    if (left <= 0) return "Out of stock";
    if (left <= 3) return "Only $left unit${left == 1 ? '' : 's'} left";
    if (left <= 10) return "Few units left";
    return "In stock";
  }

  double get averageRating {
    if ((ratingCount ?? 0) == 0) return 0.0;
    return ((ratingSum ?? 0.0) / (ratingCount ?? 1)).clamp(0, 5);
  }

  bool get inStock => (itemsLeft ?? 0) > 0;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      productDetails: json['productDetails'] != null
          ? ProductDetails.fromJson(json['productDetails'])
          : null,
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
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((r) => ReviewModel.fromJson(r)).toList()
          : [],
      isFlashSale: json['isFlashSale'],
      variants: json['variants'] != null
          ? (json['variants'] as List).map((v) => ProductVariant.fromJson(v)).toList()
          : [],
      shippingFee: json['shippingFee']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'productDetails': productDetails?.toJson(),
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
      'reviews': reviews?.map((r) => r.toJson()).toList(),
      'isFlashSale': isFlashSale,
      'variants': variants?.map((v) => v.toJson()).toList(),
      'shippingFee': shippingFee,
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    ProductDetails? productDetails,
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
    List<ReviewModel>? reviews,
    bool? isFlashSale,
    List<ProductVariant>? variants,
    double? shippingFee,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      productDetails: productDetails ?? this.productDetails,
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
      reviews: reviews ?? this.reviews,
      isFlashSale: isFlashSale ?? this.isFlashSale,
      variants: variants ?? this.variants,
      shippingFee: shippingFee ?? this.shippingFee,
    );
  }
}
