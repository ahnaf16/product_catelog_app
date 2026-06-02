import 'package:flutter/material.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/favorites/view/favorites_list_skeleton.dart';
import 'package:product_catelog_app/features/product/view/local/product_tile.dart';
import 'package:product_catelog_app/main.export.dart';

class FavoritesView extends HookConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesCtrlProvider);
    final favCtrl = useMemoized(() => ref.read(favoritesCtrlProvider.notifier));
    final hasFavorites = favoritesAsync.asData?.value.isNotEmpty ?? false;
    final isTablet = context.isTablet;
    final listPadding = EdgeInsets.symmetric(horizontal: isTablet ? 24 : 16, vertical: 16);
    final maxContentWidth = context.isLargeTablet ? 1040.0 : 920.0;

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
            onPressed: hasFavorites ? favCtrl.clearAll : null,
            icon: const Icon(LIcons.trash2),
            label: const Text('Clear All'),
          ),

          const Gap(8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: favCtrl.reload,
        child: favoritesAsync.when(
          loading: FavoritesListSkeleton.new,
          error: (error, _) => ContentStateView(
            icon: Icons.heart_broken_rounded,
            title: 'Could not load favorites',
            message: error.toString(),
            actionLabel: 'Try again',
            onActionTap: favCtrl.reload,
          ),
          data: (products) {
            if (products.isEmpty) {
              return ContentStateView(
                icon: Icons.favorite_border_rounded,
                title: 'No favorites yet',
                message: 'Save products here to keep them close.',
                actionLabel: 'Browse products',
                onActionTap: () => RPaths.products.go(context),
              );
            }

            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: ListView.separated(
                  padding: listPadding,
                  itemCount: products.length,
                  separatorBuilder: (_, _) => Gap(isTablet ? 16 : 12),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductTile(product: product, onFavTap: () => favCtrl.toggleFavorite(product));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
