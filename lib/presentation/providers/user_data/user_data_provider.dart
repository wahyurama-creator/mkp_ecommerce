import 'package:flutter/material.dart';
import 'package:mkp_ecommerce/domain/usecase/login/login.dart';
import 'package:mkp_ecommerce/domain/usecase/login/login_params.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';
import 'package:mkp_ecommerce/presentation/providers/product/product_list/product_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/product/login/login_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<String?> build() async {
    Login login = ref.read(loginProvider);
    var result = await login(null);

    switch (result) {
      case ResultSuccess(value: final token):
        return token;
      case ResultFailed(message: final _):
        return null;
    }
  }

  Future<void> login(
      {required String username, required String password}) async {
    state = const AsyncLoading();
    Login login = ref.read(loginProvider);

    var loginResult = await login(LoginParams(
      username: username,
      password: password,
    ));

    switch (loginResult) {
      case ResultSuccess(value: final user):
        _getProductList();
        state = AsyncData(user);
      case ResultFailed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  void _getProductList() {
    ref.read(productListProvider.notifier).getProductList();
  }
}
