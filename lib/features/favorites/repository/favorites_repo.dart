import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:product_catelog_app/main.export.dart';

@singleton
class FavoritesRepo {
  final _boxKey = 'favorites';

  Box<Product>? _box;

  bool get isLoaded => _box != null;

  Future<Box<Product>> init() async {
    final isOpen = Hive.isBoxOpen(_boxKey);
    if (!isOpen) {
      _box = await Hive.openBox<Product>(_boxKey);
    }
    _box = Hive.box<Product>(_boxKey);

    return _box!;
  }

  Future<List<Product>> getFavorites() async {
    if (_box == null) await init();
    return _box!.values.toList();
  }

  Future<void> addToFavorites(Product product) async {
    final box = await init();
    await box.put(product.id.toString(), product);
  }

  Future<void> removeFromFavorites(String productId) async {
    final box = await init();
    await box.delete(productId);
  }

  Future<void> clearFavorites() async {
    final box = await init();
    await box.clear();
  }

  Future<bool> isFavorite(String productId) async {
    final box = await init();
    return box.containsKey(productId);
  }
}
