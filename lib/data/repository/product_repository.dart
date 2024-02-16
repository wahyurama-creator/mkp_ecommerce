import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';

abstract interface class ProductRepository {
  Future<ResultWrapper<List<Product>>> getProductList();

  Future<ResultWrapper<Product>> getProductDetail({required int id});

  Future<ResultWrapper<String>> login({
    required String username,
    required String password,
  });

}
