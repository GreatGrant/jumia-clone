class BrandModel {
  final String id;
  final String name;
  final bool isVerified;

  BrandModel({
    required this.id,
    required this.name,
    this.isVerified = false,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: json['name'],
      isVerified: json['isVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isVerified': isVerified,
    };
  }
}
