import 'package:mkp_ecommerce/data/network/fakestore_repository.dart';
import 'package:mkp_ecommerce/data/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) =>
    FakeStoreRepository();
