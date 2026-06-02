import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_catelog_app/main.export.dart';

class ProductGridSkeleton extends StatelessWidget {
  const ProductGridSkeleton({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablet;
    final maxContentWidth = context.isLargeTablet ? 1280.0 : 1080.0;
    final crossAxisCount = context.isLargeTablet
        ? 4
        : isTablet
        ? 3
        : 2;
    final gridPadding = EdgeInsets.symmetric(
      horizontal: isTablet ? 24 : 16,
      vertical: 16,
    );
    final gridSpacing = isTablet ? 20.0 : 16.0;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: MasonryGridView.builder(
          padding: gridPadding,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          mainAxisSpacing: gridSpacing + 8,
          crossAxisSpacing: gridSpacing,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            const imageHeight = 172.0;
            return Container(
              decoration: ShapeDecoration(
                color: context.colors.primary.op1,
                shape: const RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26),
                    bottom: Radius.circular(18),
                  ),
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
        ),
      ),
    );
  }
}
