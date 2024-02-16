import 'package:mkp_ecommerce/domain/entity/product.dart';

class Cart {
  final Product product;
  int quantity;

  Cart({
    required this.product,
    required this.quantity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cart &&
          runtimeType == other.runtimeType &&
          product == other.product &&
          quantity == other.quantity);

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;

  @override
  String toString() {
    return 'Cart{ product: $product, quantity: $quantity,}';
  }

  Cart copyWith({
    Product? product,
    int? quantity,
  }) {
    return Cart(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: map['product'] as Product,
      quantity: map['quantity'] as int,
    );
  }
}
