import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';
import '../models/product_model.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(ProductModel product) {
    final existingIndex = state.indexWhere((item) => item.productId == product.id);

    if (existingIndex >= 0) {
      // Product already in cart, increment quantity if not exceeding stock
      final existingItem = state[existingIndex];

      if (existingItem.quantity < existingItem.maxStock) {
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingIndex)
              existingItem.copyWith(quantity: existingItem.quantity + 1)
            else
              state[i]
        ];
      }
    } else {
      // New product, add to cart
      final availableStock = _getAvailableStock(product);
      if (availableStock > 0) {
        final cartItem = CartItem(
          productId: product.id,
          title: product.title ?? 'Unnamed Product',
          imageUrl: product.imageUrls.isNotEmpty ? product.imageUrls.first : '',
          price: product.price,
          quantity: 1,
          maxStock: availableStock,
          product: product,
        );
        state = [...state, cartItem];
      }
    }
  }

  void incrementQuantity(String productId) {
    final existingIndex = state.indexWhere((item) => item.productId == productId);

    if (existingIndex >= 0) {
      final existingItem = state[existingIndex];
      if (existingItem.quantity < existingItem.maxStock) {
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingIndex)
              existingItem.copyWith(quantity: existingItem.quantity + 1)
            else
              state[i]
        ];
      }
    }
  }

  void decrementQuantity(String productId) {
    final existingIndex = state.indexWhere((item) => item.productId == productId);

    if (existingIndex >= 0) {
      final existingItem = state[existingIndex];
      if (existingItem.quantity > 1) {
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingIndex)
              existingItem.copyWith(quantity: existingItem.quantity - 1)
            else
              state[i]
        ];
      } else {
        // Remove item if quantity would be 0
        state = state.where((item) => item.productId != productId).toList();
      }
    }
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.productId != productId).toList();
  }

  void clearCart() {
    state = [];
  }

  int _getAvailableStock(ProductModel product) {
    // Use itemsLeft from the product if available
    if (product.itemsLeft != null && product.itemsLeft! > 0) {
      return product.itemsLeft!;
    }

    // If itemsLeft is null or 0, but the product is marked as in stock,
    // return a reasonable default
    if (product.inStock) {
      return 999; // Large number for unlimited-like stock
    }

    // Product is out of stock
    return 0;
  }
}

// Cart provider
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

// Cart item count provider
final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (total, item) => total + item.quantity);
});

// Cart total provider
final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0.0, (total, item) => total + item.totalPrice);
});

// Provider to get cart item for a specific product
final cartItemForProductProvider = Provider.family<CartItem?, String>((ref, productId) {
  final cart = ref.watch(cartProvider);
  try {
    return cart.firstWhere((item) => item.productId == productId);
  } catch (e) {
    return null;
  }
});

// Provider to check if product is in cart
final isInCartProvider = Provider.family<bool, String>((ref, productId) {
  final cartItem = ref.watch(cartItemForProductProvider(productId));
  return cartItem != null;
});

// Provider to get quantity of specific product in cart
final productQuantityInCartProvider = Provider.family<int, String>((ref, productId) {
  final cartItem = ref.watch(cartItemForProductProvider(productId));
  return cartItem?.quantity ?? 0;
});