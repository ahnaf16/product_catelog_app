import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/controller/product_ctrl.dart';
import 'package:product_catelog_app/features/product/view/product_card.dart';
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
              final filteredProducts = await productCtrl.search(query);
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
      body: productAsync.when(
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
