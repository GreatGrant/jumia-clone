import 'package:jumia_clone/features/product/data/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  final int maxStock;

  CartItem({
    required this.product,
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.maxStock,
  });

  CartItem copyWith({
    String? productId,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
    int? maxStock,
    ProductModel? product,  // Add this
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      maxStock: maxStock ?? this.maxStock,
      product: product ?? this.product,  // Add this
    );
  }

  double get totalPrice => price * quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CartItem &&
              runtimeType == other.runtimeType &&
              productId == other.productId &&
              quantity == other.quantity;

  @override
  int get hashCode => Object.hash(productId, quantity);
}

