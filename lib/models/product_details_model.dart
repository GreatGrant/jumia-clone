class ProductDetails {
  final String? description;
  final List<String>? keyFeatures;
  final Map<String, String>? specification;

  ProductDetails({
    this.description,
    this.keyFeatures,
    this.specification,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      description: json['description'],
      keyFeatures: json['keyFeatures'] != null ? List<String>.from(json['keyFeatures']) : null,
      specification: json['specification'] != null
          ? Map<String, String>.from(json['specification'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'keyFeatures': keyFeatures,
      'specification': specification,
    };
  }
}
