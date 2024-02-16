import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';
import 'package:mkp_ecommerce/presentation/providers/cart/cart_provider.dart';

class QuantitySelector extends ConsumerStatefulWidget {
  final Product product;
  final WidgetRef ref;

  const QuantitySelector({super.key, required this.product, required this.ref});

  @override
  ConsumerState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends ConsumerState<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    int quantity = ref.watch(cartProvider.notifier).getQuantity(widget.product);

    return SizedBox(
      width: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 0) {
                setState(() {
                  quantity--;
                });
                widget.ref
                    .read(cartProvider.notifier)
                    .removeProduct(widget.product);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.remove,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
          horizontalSpace(14),
          Text('$quantity'),
          horizontalSpace(14),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity++;
              });
              widget.ref.read(cartProvider.notifier).addProduct(
                    widget.product,
                  );
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
