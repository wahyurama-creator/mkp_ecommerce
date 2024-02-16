import 'package:mkp_ecommerce/data/repository/product_repository.dart';
import 'package:mkp_ecommerce/domain/usecase/base_usecase.dart';
import 'package:mkp_ecommerce/domain/usecase/login/login_params.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';

class Login implements BaseUseCase<ResultWrapper<String>, LoginParams?> {
  final ProductRepository _productRepository;

  Login({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<ResultWrapper<String>> call(LoginParams? params) async {
    if (params != null) {
      var result = await _productRepository.login(
          username: params.username, password: params.password);

      return switch (result) {
        ResultSuccess(value: final token) => ResultWrapper.success(token),
        ResultFailed(:final message) => ResultWrapper.failed(message),
      };
    } else {
      return const ResultWrapper.failed('Invalid parameter');
    }
  }
}
