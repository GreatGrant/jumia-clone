class ProductVariant {
  final String name;
  final List<String> values;

  ProductVariant({
    required this.name,
    required this.values,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      name: json['name'],
      values: List<String>.from(json['values'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}
