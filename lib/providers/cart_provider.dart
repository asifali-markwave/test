import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/models/cart_item.dart';
import 'package:test/models/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(Product product) {
    for (var i = 0; i < state.length; i++) {
      if (state[i].product.id == product.id) {
        state[i].quantity++;
        state = [...state];
        return;
      }
    }
    state = [...state, CartItem(product: product)];
  }

  void removeItem(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
