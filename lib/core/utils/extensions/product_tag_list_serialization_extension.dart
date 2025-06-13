import 'package:jumia_clone/core/utils/extensions/product_tag_serialization_extension.dart';

import '../product_tag.dart';

extension ProductTagListSerialization on List<ProductTag> {
  List<String> toJsonList() => map((tag) => tag.toJson()).toList();

  static List<ProductTag> fromJsonList(List<dynamic> jsonList) => jsonList
      .map((value) => ProductTagSerialization.fromJson(value as String))
      .toList();
}
