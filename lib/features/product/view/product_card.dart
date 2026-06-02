import 'package:flutter/material.dart';
import 'package:product_catelog_app/_widgets/u_image.dart';
import 'package:product_catelog_app/features/favorites/controller/favorites_ctrl.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductCard extends HookConsumerWidget {
  const ProductCard({super.key, required this.product, required this.onFavTap});
  final Product product;

  final Function() onFavTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFev = ref.watch(isProductFavoriteProvider(product.id.toString())).value ?? false;

    return GestureDetector(
      onTap: () => RPaths.productDetails(product.id.toString()).push(context),
      child: Container(
        decoration: ShapeDecoration(
          color: context.colors.primary.op1,
          shape: const RoundedSuperellipseBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(26), bottom: Radius.circular(18)),
          ),
        ),

        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'product-${product.id}',
                  child: Material(
                    type: .transparency,
                    child: UImage(
                      product.image,
                      fit: BoxFit.contain,
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      backgroundColor: context.colors.onPrimary.op(context.isDark ? .4 : 1),
                      borderRadius: 26,
                    ),
                  ),
                ),

                Positioned(
                  top: 3,
                  right: 3,
                  child: IconButton.filledTonal(
                    onPressed: onFavTap,
                    icon: Icon(
                      isFev ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: context.colors.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.category.toUpperCase(),
                          style: context.text.labelSmall?.bold.letterSpace(1).textColor(context.colors.primary.op(0.7)),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                          Text(' ${product.rating.rate}', style: context.text.labelSmall?.bold),
                        ],
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleMedium?.semiBold,
                  ),
                  const Gap(2),
                  Text(
                    product.price.currency(),
                    style: context.text.bodyLarge?.black.textColor(context.colors.onSurface),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
