import 'package:mkp_ecommerce/domain/usecase/get_product_detail/get_product_detail.dart';
import 'package:mkp_ecommerce/presentation/providers/repository/product_repository/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_product_detail_provider.g.dart';

@riverpod
GetProductDetail getProductDetail(GetProductDetailRef ref) => GetProductDetail(
      productRepository: ref.watch(productRepositoryProvider),
    );