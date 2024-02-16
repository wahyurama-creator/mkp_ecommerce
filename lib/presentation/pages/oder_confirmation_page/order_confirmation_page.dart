import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/domain/entity/cart.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';
import 'package:mkp_ecommerce/presentation/providers/cart/cart_provider.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/button/primary_button.dart';
import 'package:mkp_ecommerce/presentation/widgets/product_item_card/product_item_card_checkout.dart';
import 'package:mkp_ecommerce/presentation/widgets/app_bar/top_app_bar.dart';

class OrderConfirmationPage extends ConsumerWidget {
  final Cart cart;

  const OrderConfirmationPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(12),
                    TopAppBar(
                      title: 'Checkout Confirmation',
                      onTap: () {
                        ref.read(routerProvider).pop();
                      },
                    ),
                    verticalSpace(32),
                    const Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Address:',
                              style: TextStyle(fontSize: 12)),
                          verticalSpace(4),
                          const Text(
                            'Jl. Raya Bogor No. 1',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(24),
                    const Text(
                      'Shopping List',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(10),
                    ProductItemCardCheckout(cart: cart),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                title: 'Process Payment',
                onPressed: () {
                  ref.read(cartProvider.notifier).clearProduct(cart.product);
                  ref.read(routerProvider).pushReplacementNamed('order-success');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
