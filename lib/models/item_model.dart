class ItemModel {
  final String id;
  final String? title;
  final String? description;
  final List<String> imageUrls;
  final double? rating;
  final double price;
  final double? originalPrice;
  final double? discountPercentage;
  final int? itemsLeft;

  ItemModel({
    required this.id,
    this.title,
    this.description,
    required this.imageUrls,
    this.rating,
    required this.price,
    this.originalPrice,
    this.discountPercentage,
    this.itemsLeft,
  });
}