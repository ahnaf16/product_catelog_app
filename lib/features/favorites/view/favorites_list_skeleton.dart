import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class FavoritesListSkeleton extends StatelessWidget {
  const FavoritesListSkeleton({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablet;
    final listPadding = EdgeInsets.symmetric(
      horizontal: isTablet ? 24 : 16,
      vertical: 16,
    );
    final maxContentWidth = context.isLargeTablet ? 1040.0 : 920.0;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: ListView.separated(
          padding: listPadding,
          itemCount: itemCount,
          separatorBuilder: (_, _) => Gap(isTablet ? 16 : 12),
          itemBuilder: (context, index) {
            final imageSize = isTablet ? 132.0 : 112.0;
            return Container(
              padding: EdgeInsets.all(isTablet ? 16 : 12),
              decoration: ShapeDecoration(
                color: context.colors.surfaceContainerLow,
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Row(
                children: [
                  SkeletonBox(
                    height: imageSize,
                    width: imageSize,
                    borderRadius: 22,
                  ),
                  Gap(isTablet ? 18 : 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        SkeletonBox(height: 10, width: 76, borderRadius: 999),
                        Gap(10),
                        SkeletonBox(height: 18),
                        Gap(8),
                        SkeletonBox(height: 18, width: 160),
                        Gap(10),
                        SkeletonBox(height: 14),
                        Gap(6),
                        SkeletonBox(height: 14, width: 180),
                        Gap(14),
                        Row(
                          children: [
                            SkeletonBox(height: 18, width: 78),
                            Spacer(),
                            SkeletonBox(height: 18, width: 54),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(isTablet ? 16 : 12),
                  const SkeletonBox(height: 40, width: 40, borderRadius: 999),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
