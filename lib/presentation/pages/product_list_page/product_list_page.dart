import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/presentation/providers/product/product_list/product_list_provider.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/product_item_card/product_item_card.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(productListProvider).when(
            data: (products) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 16 : 0,
                      bottom: index == products.length - 1 ? 100 : 0,
                    ),
                    child: ProductItemCard(
                      product: products[index],
                      onTap: (product) {
                        ref.read(routerProvider).pushNamed(
                              'product-detail',
                              extra: product,
                            );
                      },
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          ),
    );
  }
}
