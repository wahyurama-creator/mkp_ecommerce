import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/domain/entity/cart.dart';
import 'package:mkp_ecommerce/presentation/providers/cart/cart_notifier.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>(
  (ref) => CartNotifier(),
);
