import 'package:mkp_ecommerce/data/repository/product_repository.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/usecase/base_usecase.dart';
import 'package:mkp_ecommerce/domain/usecase/get_product_detail/get_product_detail_params.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';

class GetProductDetail
    implements BaseUseCase<ResultWrapper<Product>, GetProductDetailParams> {
  final ProductRepository _productRepository;

  GetProductDetail({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<ResultWrapper<Product>> call(GetProductDetailParams params) async {
    var result =
        await _productRepository.getProductDetail(id: params.productId);

    return switch (result) {
      ResultSuccess(value: final product) => ResultWrapper.success(product),
      ResultFailed(:final message) => ResultWrapper.failed(message),
    };
  }
}
