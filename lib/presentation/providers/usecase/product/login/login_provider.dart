import 'package:mkp_ecommerce/domain/usecase/login/login.dart';
import 'package:mkp_ecommerce/presentation/providers/repository/product_repository/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
      productRepository: ref.watch(productRepositoryProvider),
    );
