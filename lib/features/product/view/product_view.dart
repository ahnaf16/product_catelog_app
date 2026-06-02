import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/controller/product_ctrl.dart';
import 'package:product_catelog_app/features/product/view/product_card.dart';
import 'package:product_catelog_app/features/product/view/product_grid_skeleton.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productCtrlProvider);
    final productCtrl = useMemoized(() => ref.read(productCtrlProvider.notifier));
    final favCtrl = useMemoized(() => ref.read(favoritesCtrlProvider.notifier));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: context.colors.surface,
        title: Text('Catalog', style: context.text.titleLarge?.bold.letterSpace(1)),
        actions: [
          SearchAnchor(
            viewHintText: 'Search by name or category',
            dividerColor: context.colors.outlineVariant,
            builder: (context, ctrl) => IconButton(onPressed: ctrl.openView, icon: const Icon(LIcons.search)),
            suggestionsBuilder: (context, ctrl) async {
              final query = ctrl.text.low;
              if (query.isEmpty) {
                return const [
                  SizedBox(
                    height: 220,
                    child: ContentStateView(
                      icon: LIcons.search,
                      title: 'Search products',
                      message: 'Type a product name or category to find items quickly.',
                    ),
                  ),
                ];
              }

              final filteredProducts = await productCtrl.search(query);
              if (filteredProducts.isEmpty) {
                return const [
                  SizedBox(
                    height: 220,
                    child: ContentStateView(
                      icon: LIcons.search,
                      title: 'No matches found',
                      message: 'Try a different product name or category.',
                    ),
                  ),
                ];
              }

              return filteredProducts.map(
                (product) => ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.transparent, child: UImage(product.image)),
                  title: Text(product.title, maxLines: 1),
                  subtitle: Text(product.price.currency()),
                  onTap: () {
                    ctrl.clear();
                    ctrl.closeView(null);
                    RPaths.productDetails(product.id.toString()).push(context);
                  },
                ),
              );
            },
          ),
          const Gap(8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: productCtrl.reload,
        child: productAsync.when(
          loading: () => const ProductGridSkeleton(),
          error: (error, _) => ContentStateView(
            icon: Icons.cloud_off_rounded,
            title: 'Could not load products',
            message: error.toString(),
            actionLabel: 'Try again',
            onActionTap: productCtrl.reload,
          ),
          data: (products) {
            if (products.isEmpty) {
              return const ContentStateView(
                icon: Icons.inventory_2_outlined,
                title: 'No products found',
                message: 'The catalog is empty right now. Check back in a bit.',
              );
            }

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
      ),
    );
  }
}
