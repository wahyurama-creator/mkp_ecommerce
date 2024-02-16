import 'package:flutter/material.dart';
import 'package:mkp_ecommerce/domain/entity/cart.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/presentation/extension/int_extensions.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';

class CartItemCard extends StatelessWidget {
  final Cart cartItem;
  final Function(Product)? onTap;

  const CartItemCard({
    super.key,
    required this.cartItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(cartItem.product);
        }
      },
      child: Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(cartItem.product.image),
                  fit: BoxFit.fitWidth,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
            horizontalSpace(8),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 14, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.product.title,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(4),
                        Text(
                          cartItem.product.price.toIDRCurrencyFormat(),
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 14),
                        ),
                        verticalSpace(8),
                        Text(
                          'Quantity: ${cartItem.quantity}',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$${cartItem.product.price * cartItem.quantity}',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
