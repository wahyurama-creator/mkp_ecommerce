import 'package:mkp_ecommerce/domain/usecase/get_product_list/get_product_list.dart';
import 'package:mkp_ecommerce/presentation/providers/repository/product_repository/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_product_list_provider.g.dart';

@riverpod
GetProductList getProductList(GetProductListRef ref) => GetProductList(
    productRepository: ref.watch(productRepositoryProvider),
);