// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesCtrl)
final favoritesCtrlProvider = FavoritesCtrlProvider._();

final class FavoritesCtrlProvider
    extends $AsyncNotifierProvider<FavoritesCtrl, List<Product>> {
  FavoritesCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesCtrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesCtrlHash();

  @$internal
  @override
  FavoritesCtrl create() => FavoritesCtrl();
}

String _$favoritesCtrlHash() => r'8f04d78fd9e25c0f1dda6bf24450b26cbc7e8768';

abstract class _$FavoritesCtrl extends $AsyncNotifier<List<Product>> {
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

@ProviderFor(isProductFavorite)
final isProductFavoriteProvider = IsProductFavoriteFamily._();

final class IsProductFavoriteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsProductFavoriteProvider._({
    required IsProductFavoriteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isProductFavoriteProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isProductFavoriteHash();

  @override
  String toString() {
    return r'isProductFavoriteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isProductFavorite(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsProductFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isProductFavoriteHash() => r'd8bc1228ad8a54c451d81f2b1d03b7abc48fa7fc';

final class IsProductFavoriteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  IsProductFavoriteFamily._()
    : super(
        retry: null,
        name: r'isProductFavoriteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  IsProductFavoriteProvider call(String id) =>
      IsProductFavoriteProvider._(argument: id, from: this);

  @override
  String toString() => r'isProductFavoriteProvider';
}
