import 'package:product_catelog_app/features/product/repository/product_repo.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_ctrl.g.dart';

@Riverpod(keepAlive: true)
class ProductCtrl extends _$ProductCtrl {
  final _repo = locate<ProductRepo>();
  @override
  FutureOr<List<Product>> build() async {
    return _inti();
  }

  FutureOr<List<Product>> _inti() async {
    final res = await _repo.getProducts();
    return res.fold(failToErr, (r) => r);
  }

  FutureOr<List<Product>> search(String query) async {
    final current = await future;
    query = query.low;

    return current.where((p) => p.title.low.contains(query) || p.category.low.contains(query)).toList();
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => _inti());
  }
}
