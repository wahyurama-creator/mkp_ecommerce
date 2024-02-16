import 'package:mkp_ecommerce/data/repository/product_repository.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/usecase/base_usecase.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';

class GetProductList
    implements BaseUseCase<ResultWrapper<List<Product>>, void> {
  final ProductRepository _productRepository;

  GetProductList({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<ResultWrapper<List<Product>>> call(void params) async {
    var result = await _productRepository.getProductList();

    return switch (result) {
      ResultSuccess(value: final products) => ResultWrapper.success(products),
      ResultFailed(:final message) => ResultWrapper.failed(message),
    };
  }
}
