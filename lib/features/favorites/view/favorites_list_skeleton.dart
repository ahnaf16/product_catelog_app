import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class FavoritesListSkeleton extends StatelessWidget {
  const FavoritesListSkeleton({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      separatorBuilder: (_, _) => const Gap(12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: context.colors.surfaceContainerLow,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Row(
            children: [
              SkeletonBox(height: 112, width: 112, borderRadius: 22),
              Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              Gap(12),
              SkeletonBox(height: 40, width: 40, borderRadius: 999),
            ],
          ),
        );
      },
    );
  }
}
