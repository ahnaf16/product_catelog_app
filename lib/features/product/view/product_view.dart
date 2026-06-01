import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/features/product/controller/product_ctrl.dart';
import 'package:product_catelog_app/features/product/view/product_card.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productCtrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog', style: context.text.titleLarge?.bold.letterSpace(1)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LIcons.search)),
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
              return ProductCard(product: products[index]);
            },
          );
        },
      ),
    );
  }
}
