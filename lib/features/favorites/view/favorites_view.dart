import 'package:flutter/material.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/view/product_tile.dart';
import 'package:product_catelog_app/main.export.dart';

class FavoritesView extends HookConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesCtrlProvider);
    final favCtrl = useMemoized(() => ref.read(favoritesCtrlProvider.notifier));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: context.colors.surface,
        title: Text('Favorites', style: context.text.titleLarge?.bold.letterSpace(1)),
        actions: [
          TextButton.icon(
            style: IconButton.styleFrom(
              foregroundColor: context.colors.error,
              backgroundColor: context.colors.errorContainer,
            ),
            onPressed: () => favCtrl.clearAll(),
            icon: const Icon(LIcons.trash2),
            label: const Text('Clear All'),
          ),

          const Gap(8),
        ],
      ),
      body: favoritesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (products) {
          if (products.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border_rounded, size: 48, color: context.colors.outline),
                    const Gap(12),
                    Text('No favorites yet', style: context.text.titleMedium?.semiBold),
                    const Gap(4),
                    Text(
                      'Save products here to keep them close.',
                      textAlign: TextAlign.center,
                      style: context.text.bodyMedium?.textColor(context.colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (_, _) => const Gap(12),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductTile(product: product, onFavTap: () => favCtrl.toggleFavorite(product));
            },
          );
        },
      ),
    );
  }
}
