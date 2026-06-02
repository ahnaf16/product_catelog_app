import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductDetailsSkeleton extends StatelessWidget {
  const ProductDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: SkeletonBox(height: 40, width: 40, borderRadius: 999),
            ),
          ],
          flexibleSpace: const FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: SkeletonBox(borderRadius: 32)),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.onPrimary.op(context.isDark ? .6 : 1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SkeletonBox(height: 32, width: 96, borderRadius: 12),
                    Spacer(),
                    SkeletonBox(height: 20, width: 110, borderRadius: 999),
                  ],
                ),
                Gap(18),
                SkeletonBox(
                  height: 34,
                  width: double.infinity,
                  borderRadius: 14,
                ),
                Gap(10),
                SkeletonBox(height: 34, width: 120, borderRadius: 14),
                Gap(32),
                SkeletonBox(height: 20, width: 110, borderRadius: 12),
                Gap(12),
                SkeletonBox(
                  height: 16,
                  width: double.infinity,
                  borderRadius: 10,
                ),
                Gap(8),
                SkeletonBox(
                  height: 16,
                  width: double.infinity,
                  borderRadius: 10,
                ),
                Gap(8),
                SkeletonBox(height: 16, width: 240, borderRadius: 10),
                Gap(150),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
