import 'package:flutter/material.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/features/product/view/local/favorite_button.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductTile extends HookConsumerWidget {
  const ProductTile({super.key, required this.product, required this.onFavTap});

  final Product product;
  final VoidCallback onFavTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(isProductFavoriteProvider(product.id.toString())).value ?? false;

    return Container(
      decoration: BoxDecoration(color: context.colors.primary.op1, borderRadius: BorderRadius.circular(24)),
      child: GestureDetector(
        behavior: .opaque,
        onTap: () => RPaths.productDetails(product.id.toString()).push(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'product-${product.id}',
                    child: Material(
                      type: .transparency,
                      child: UImage(
                        product.image,
                        height: 120,
                        width: 110,
                        fit: BoxFit.contain,
                        padding: const EdgeInsets.all(12),
                        borderRadius: 20,
                      ),
                    ),
                  ),
                  const Gap(16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: context.colors.primary.op(.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            product.category.toUpperCase(),
                            style: context.text.labelSmall?.bold.letterSpace(1).textColor(context.colors.primary),
                          ),
                        ),
                        const Gap(8),
                        Text(
                          product.title,
                          maxLines: 2,
                          style: context.text.titleMedium?.semiBold.letterSpace(-0.2).textHeight(1.25),
                        ),
                        const Gap(12),

                        Row(
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .end,
                          children: [
                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Price',
                                  style: context.text.labelSmall?.textColor(context.colors.onSurfaceVariant.op(.6)),
                                ),
                                Text(
                                  product.price.currency(),
                                  style: context.text.titleLarge?.black.textColor(context.colors.primary),
                                ),
                              ],
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                spacing: 4,
                                children: [
                                  Icon(Icons.star_rounded, color: Colors.amber.shade800, size: 16),
                                  Text(
                                    '${product.rating.rate}',
                                    style: context.text.labelMedium?.bold.textColor(Colors.amber.shade900),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                child: FavoriteButton(isFav: isFav, onTap: onFavTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
