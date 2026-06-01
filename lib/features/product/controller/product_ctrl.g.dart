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
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productCtrlHash();

  @$internal
  @override
  ProductCtrl create() => ProductCtrl();
}

String _$productCtrlHash() => r'7a2d5e0c8ad8aa0214a2096425856be8e951aa13';

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
