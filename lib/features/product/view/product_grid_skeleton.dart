import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductGridSkeleton extends StatelessWidget {
  const ProductGridSkeleton({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        const imageHeight = 172.0;
        return Container(
          decoration: ShapeDecoration(
            color: context.colors.primary.op1,
            shape: const RoundedSuperellipseBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(26), bottom: Radius.circular(18)),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                SkeletonBox(height: imageHeight, borderRadius: 24),
                Gap(6),
                SkeletonBox(height: 10, width: 72, borderRadius: 999),
                SkeletonBox(height: 18, width: 132),
                SkeletonBox(height: 16, width: 84),
              ],
            ),
          ),
        );
      },
    );
  }
}
