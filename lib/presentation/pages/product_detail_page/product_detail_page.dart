import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/presentation/extension/extensions.dart';
import 'package:mkp_ecommerce/presentation/extension/int_extensions.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';
import 'package:mkp_ecommerce/presentation/providers/cart/cart_provider.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/button/primary_button.dart';
import 'package:mkp_ecommerce/presentation/widgets/selector/quantity_selector.dart';
import 'package:mkp_ecommerce/presentation/widgets/app_bar/top_app_bar.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  ConsumerState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              verticalSpace(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TopAppBar(
                  title: widget.product.title,
                  onTap: () {
                    ref.read(routerProvider).pop();
                  },
                ),
              ),
              verticalSpace(32),
              Image.network(
                widget.product.image,
                fit: BoxFit.contain,
                height: 300,
              ),
              verticalSpace(16),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(16),
                    Text(
                      widget.product.price.toCurrencyFormat(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    verticalSpace(24),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(8),
                    Text(widget.product.description),
                    verticalSpace(100),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  children: [
                    QuantitySelector(product: widget.product, ref: ref),
                    horizontalSpace(32),
                    Expanded(
                      flex: 1,
                      child: PrimaryButton(
                        onPressed: () {
                          var quantity = ref
                              .read(cartProvider.notifier)
                              .getQuantity(widget.product);
                          if (quantity > 0) {
                            var cart = ref
                                .read(cartProvider.notifier)
                                .getCartByProductId(widget.product.id);
                            ref.read(routerProvider).pushNamed(
                                  'order-confirmation',
                                  extra: cart,
                                );
                          } else {
                            context
                                .showSnackBar('Quantity must be more than 0');
                          }
                        },
                        title: 'Checkout',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
