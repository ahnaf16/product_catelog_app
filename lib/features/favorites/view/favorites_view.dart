import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/view/product_card.dart';
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
        title: Text('Catalog', style: context.text.titleLarge?.bold.letterSpace(1)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LIcons.search)),

          const Gap(8),
        ],
      ),
      body: favoritesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (products) {
          return MasonryGridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product, onFavTap: () => favCtrl.toggleFavorite(product));
            },
          );
        },
      ),
    );
  }
}
