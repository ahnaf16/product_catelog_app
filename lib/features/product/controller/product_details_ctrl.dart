import 'package:product_catelog_app/features/product/repository/product_repo.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_ctrl.g.dart';

@Riverpod(keepAlive: true)
class ProductDetailsCtrl extends _$ProductDetailsCtrl {
  final _repo = locate<ProductRepo>();
  @override
  FutureOr<Product> build(String id) async {
    return _inti();
  }

  FutureOr<Product> _inti() async {
    final res = await _repo.getProduct(id);
    return res.fold(failToErr, (r) => r);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => _inti());
  }
}
