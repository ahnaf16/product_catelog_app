import 'package:flutter/material.dart';
import 'package:product_catelog_app/_widgets/u_image.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/controller/product_details_ctrl.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductDetailsView extends HookConsumerWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = context.param('id') ?? '';
    final productAsync = ref.watch(productDetailsCtrlProvider(id));
    final favCtrl = useMemoized(() => ref.read(favoritesCtrlProvider.notifier));
    final isFev = ref.watch(isProductFavoriteProvider(id)).value ?? false;

    return productAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator.adaptive()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(error.toString())),
      ),
      data: (product) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                elevation: 0,
                backgroundColor: context.colors.surface,
                expandedHeight: 400,
                pinned: true,
                stretch: true,
                leadingWidth: 70,
                leading: Center(
                  child: IconButton.filledTonal(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                  ),
                ),
                actions: [
                  IconButton(
                    style: IconButton.styleFrom(foregroundColor: context.colors.primary),
                    onPressed: () => favCtrl.toggleFavorite(product),
                    icon: Icon(isFev ? Icons.favorite_rounded : Icons.favorite_border_rounded, size: 20),
                  ),
                  const Gap(8),
                ],

                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.all(40),
                    child: Hero(
                      tag: 'product-${product.id}',
                      child: Material(
                        type: .transparency,
                        child: UImage(product.image, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.onPrimary.op(context.isDark ? .6 : 1),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: context.colors.primaryContainer.op(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              product.category.toUpperCase(),
                              style: context.text.labelMedium?.bold.textColor(context.colors.primary),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                              Text(' ${product.rating.rate} ', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('(${product.rating.count} reviews)', style: context.text.bodySmall),
                            ],
                          ),
                        ],
                      ),

                      const Gap(16),
                      Text(product.title, style: context.text.headlineSmall?.bold.textHeight(1.2)),
                      const Gap(8),
                      Text(
                        product.price.currency(),
                        style: context.text.headlineSmall?.bold.textColor(context.colors.primary),
                      ),

                      const Divider(height: 32),

                      Text('Description', style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const Gap(8),
                      Text(product.description, style: context.text.bodyLarge?.textHeight(1.5).op(.7)),

                      const Gap(150),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
