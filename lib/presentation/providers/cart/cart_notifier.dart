import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/domain/entity/cart.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  CartNotifier() : super([]);

  void addProduct(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      state[index] = Cart(
        product: product,
        quantity: state[index].quantity + 1,
      );
    } else {
      state = [
        ...state,
        Cart(
          product: product,
          quantity: 1,
        ),
      ];
    }
  }

  void removeProduct(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      state[index] = Cart(
        product: product,
        quantity: state[index].quantity - 1,
      );
      if (state[index].quantity == 0) {
        state = state.where((item) => item.product.id != product.id).toList();
      }
    }
  }

  void clearProduct(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }

  int getQuantity(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      return state[index].quantity;
    }
    return 0;
  }

  Cart? getCartByProductId(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      return state[index];
    }
    return null;
  }
}
