import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/presentation/providers/cart/cart_provider.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/cart_item_card/cart_item_card.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          return cart.isNotEmpty
              ? ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return CartItemCard(
                      cartItem: item,
                      onTap: (product) => ref.read(routerProvider).pushNamed(
                            'product-detail',
                            extra: product,
                          ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'Cart is empty',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
