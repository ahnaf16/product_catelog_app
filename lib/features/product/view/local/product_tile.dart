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
    final isFav =
        ref.watch(isProductFavoriteProvider(product.id.toString())).value ??
        false;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;
        final imageWidth = isWide ? 148.0 : 110.0;
        final imageHeight = isWide ? 148.0 : 120.0;
        final tilePadding = isWide ? 16.0 : 12.0;
        final spacing = isWide ? 20.0 : 16.0;

        return Container(
          decoration: BoxDecoration(
            color: context.colors.primary.op1,
            borderRadius: BorderRadius.circular(24),
          ),
          child: GestureDetector(
            behavior: .opaque,
            onTap: () =>
                RPaths.productDetails(product.id.toString()).push(context),
            child: Padding(
              padding: EdgeInsets.all(tilePadding),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'product-${product.id}',
                        child: Material(
                          type: .transparency,
                          child: UImage(
                            product.image,
                            height: imageHeight,
                            width: imageWidth,
                            fit: BoxFit.contain,
                            padding: EdgeInsets.all(isWide ? 16 : 12),
                            borderRadius: 20,
                          ),
                        ),
                      ),
                      Gap(spacing),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.primary.op(.08),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                product.category.toUpperCase(),
                                style: context.text.labelSmall?.bold
                                    .letterSpace(1)
                                    .textColor(context.colors.primary),
                              ),
                            ),
                            const Gap(8),
                            Text(
                              product.title,
                              maxLines: isWide ? 3 : 2,
                              style: context.text.titleMedium?.semiBold
                                  .letterSpace(-0.2)
                                  .textHeight(1.25),
                            ),
                            Gap(isWide ? 16 : 12),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              crossAxisAlignment: .end,
                              children: [
                                Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: context.text.labelSmall?.textColor(
                                        context.colors.onSurfaceVariant.op(.6),
                                      ),
                                    ),
                                    Text(
                                      product.price.currency(),
                                      style:
                                          (isWide
                                                  ? context.text.headlineSmall
                                                  : context.text.titleLarge)
                                              ?.black
                                              .textColor(
                                                context.colors.primary,
                                              ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    spacing: 4,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber.shade800,
                                        size: 16,
                                      ),
                                      Text(
                                        '${product.rating.rate}',
                                        style: context.text.labelMedium?.bold
                                            .textColor(Colors.amber.shade900),
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
      },
    );
  }
}
