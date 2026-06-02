import 'dart:async';

import 'package:flutter/services.dart';
import 'package:product_catelog_app/features/favorites/repository/favorites_repo.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_ctrl.g.dart';

@Riverpod(keepAlive: true)
class FavoritesCtrl extends _$FavoritesCtrl {
  final _repo = locate<FavoritesRepo>();

  @override
  FutureOr<List<Product>> build() async {
    await _repo.init();
    return _repo.getFavorites();
  }

  Future<void> toggleFavorite(Product product) async {
    unawaited(HapticFeedback.selectionClick());
    final isFav = await _repo.isFavorite(product.id.toString());
    if (isFav) {
      await _repo.removeFromFavorites(product.id.toString());
    } else {
      await _repo.addToFavorites(product);
    }
    ref.invalidateSelf();
  }

  Future<void> clearAll() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repo.clearFavorites();
      return [];
    });
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => build());
  }
}

@Riverpod(keepAlive: true)
FutureOr<bool> isProductFavorite(Ref ref, String id) async {
  final favList = await ref.watch(favoritesCtrlProvider.future);
  return favList.map((e) => e.id.toString()).contains(id);
}
