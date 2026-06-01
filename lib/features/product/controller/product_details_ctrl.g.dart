// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductDetailsCtrl)
final productDetailsCtrlProvider = ProductDetailsCtrlFamily._();

final class ProductDetailsCtrlProvider
    extends $AsyncNotifierProvider<ProductDetailsCtrl, Product> {
  ProductDetailsCtrlProvider._({
    required ProductDetailsCtrlFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailsCtrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailsCtrlHash();

  @override
  String toString() {
    return r'productDetailsCtrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetailsCtrl create() => ProductDetailsCtrl();

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsCtrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailsCtrlHash() =>
    r'6f1a67d71130e8d90524a90d3ec8edc37d3ccf55';

final class ProductDetailsCtrlFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetailsCtrl,
          AsyncValue<Product>,
          Product,
          FutureOr<Product>,
          String
        > {
  ProductDetailsCtrlFamily._()
    : super(
        retry: null,
        name: r'productDetailsCtrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailsCtrlProvider call(String id) =>
      ProductDetailsCtrlProvider._(argument: id, from: this);

  @override
  String toString() => r'productDetailsCtrlProvider';
}

abstract class _$ProductDetailsCtrl extends $AsyncNotifier<Product> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Product> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Product>, Product>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Product>, Product>,
              AsyncValue<Product>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
