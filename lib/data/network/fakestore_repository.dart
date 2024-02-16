import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mkp_ecommerce/data/repository/product_repository.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';

class FakeStoreRepository implements ProductRepository {
  final Dio? _dio;

  FakeStoreRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<ResultWrapper<Product>> getProductDetail({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://fakestoreapi.com/products/$id',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      return ResultWrapper.success(Product.fromMap(response.data));
    } on DioException catch (e) {
      return ResultWrapper.failed(e.message.toString());
    }
  }

  @override
  Future<ResultWrapper<List<Product>>> getProductList() async {
    try {
      final response = await _dio!.get(
        'https://fakestoreapi.com/products',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      final results = List<Map<String, dynamic>>.from(response.data);
      final products = results.map((e) => Product.fromMap(e)).toList();
      log(products.toString());

      return ResultWrapper.success(products);
    } on DioException catch (e) {
      return ResultWrapper.failed(e.message.toString());
    }
  }

  @override
  Future<ResultWrapper<String>> login(
      {required String username, required String password}) async {
    try {
      final response = await _dio!.post(
        'https://fakestoreapi.com/auth/login',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      return ResultWrapper.success(response.data['token']);
    } on DioException catch (e) {
      return ResultWrapper.failed(e.message.toString());
    }
  }

}
