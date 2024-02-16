import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/domain/usecase/get_product_list/get_product_list.dart';
import 'package:mkp_ecommerce/domain/wrapper/result_wrapper.dart';
import 'package:mkp_ecommerce/presentation/providers/usecase/product/get_product_list/get_product_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ProductList extends _$ProductList {
  @override
  FutureOr<List<Product>> build() => const [];

  Future<void> getProductList() async {
    state = const AsyncLoading();

    GetProductList getProductList = ref.read(getProductListProvider);
    var result = await getProductList(null);

    switch (result) {
      case ResultSuccess(value: final products):
        state = AsyncData(products);
      case ResultFailed(message: _):
        state = const AsyncData([]);
    }
  }
}
