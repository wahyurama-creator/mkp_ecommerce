import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/usecase/get_product_detail/get_product_detail.dart';
import 'package:mkp_ecommerce/domain/usecase/get_product_detail/get_product_detail_params.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';
import 'package:mkp_ecommerce/presentation/providers/usecase/product/get_product_detail/get_product_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_detail_provider.g.dart';

@riverpod
Future<Product?> productDetail(
  ProductDetailRef ref, {
  required Product product,
}) async {
  GetProductDetail getProductDetail = ref.read(getProductDetailProvider);
  var result = await getProductDetail
      .call(GetProductDetailParams(productId: product.id));

  return switch (result) {
    ResultSuccess(value: final product) => product,
    ResultFailed() => null
  };
}
