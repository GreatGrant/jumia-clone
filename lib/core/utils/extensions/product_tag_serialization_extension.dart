import '../product_tag.dart';

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
