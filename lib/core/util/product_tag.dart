import 'dart:ui';
import 'package:flutter/material.dart';

sealed class ProductTag {
  const ProductTag();

  factory ProductTag.payOnDelivery() => const PayOnDelivery();
  factory ProductTag.nonReturnable() => const NonReturnable();
  factory ProductTag.freeShipping() => const FreeShipping();
  factory ProductTag.limitedOffer() => const LimitedOffer();
  factory ProductTag.officialStore() => const OfficialStore();

  String get label;
  Color get backgroundColor;
  Color get textColor;
  EdgeInsetsGeometry get padding => const EdgeInsets.symmetric(horizontal: 4, vertical: 4);
  BorderRadiusGeometry get borderRadius => BorderRadius.circular(2);
  TextStyle get textStyle => TextStyle(
    color: textColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  Widget toWidget() => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
    ),
    child: Text(label, style: textStyle),
  );
}

class PayOnDelivery extends ProductTag {
  const PayOnDelivery();

  @override String get label => 'Pay on Delivery';
  @override Color get backgroundColor => Colors.green;
  @override Color get textColor => Colors.white;
}

class NonReturnable extends ProductTag {
  const NonReturnable();

  @override String get label => 'Non-returnable';
  @override Color get backgroundColor => Colors.cyan;
  @override Color get textColor => Colors.white;
}

class FreeShipping extends ProductTag {
  const FreeShipping();

  @override String get label => 'Free Shipping';
  @override Color get backgroundColor => Colors.blue;
  @override Color get textColor => Colors.white;
}

class LimitedOffer extends ProductTag {
  const LimitedOffer();

  @override String get label => 'Limited Offer';
  @override Color get backgroundColor => Colors.red;
  @override Color get textColor => Colors.white;
}

class OfficialStore extends ProductTag {
  const OfficialStore();

  @override String get label => 'Best Seller';
  @override Color get backgroundColor => Colors.orange;
  @override Color get textColor => Colors.black;
}

extension ProductTagSerialization on ProductTag {
  String toJson() => switch (this) {
    PayOnDelivery() => 'payOnDelivery',
    NonReturnable() => 'nonReturnable',
    FreeShipping() => 'freeShipping',
    LimitedOffer() => 'limitedOffer',
    OfficialStore() => 'bestSeller',
  };

  static ProductTag fromJson(String value) => switch (value) {
    'payOnDelivery' => ProductTag.payOnDelivery(),
    'nonReturnable' => ProductTag.nonReturnable(),
    'freeShipping' => ProductTag.freeShipping(),
    'limitedOffer' => ProductTag.limitedOffer(),
    'bestSeller' => ProductTag.officialStore(),
    _ => throw ArgumentError('Unknown ProductTag value: $value'),
  };
}

extension ProductTagListSerialization on List<ProductTag> {
  List<String> toJsonList() => map((tag) => tag.toJson()).toList();

  static List<ProductTag> fromJsonList(List<dynamic> jsonList) => jsonList
      .map((value) => ProductTagSerialization.fromJson(value as String))
      .toList();
}

extension ProductTagUtilities on ProductTag {
  static List<ProductTag> get all => [
    ProductTag.payOnDelivery(),
    ProductTag.nonReturnable(),
    ProductTag.freeShipping(),
    ProductTag.limitedOffer(),
    ProductTag.officialStore(),
  ];

  static ProductTag? fromLabel(String label) {
    try {
      return all.firstWhere((tag) => tag.label == label);
    } catch (e) {
      return null;
    }
  }
}