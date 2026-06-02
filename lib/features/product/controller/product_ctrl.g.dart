// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductCtrl)
final productCtrlProvider = ProductCtrlProvider._();

final class ProductCtrlProvider
    extends $AsyncNotifierProvider<ProductCtrl, List<Product>> {
  ProductCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productCtrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productCtrlHash();

  @$internal
  @override
  ProductCtrl create() => ProductCtrl();
}

String _$productCtrlHash() => r'8ff507e5d990aceb6ea09ab77c3d335d83ecec1e';

abstract class _$ProductCtrl extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
