import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class SkeletonBox extends HookWidget {
  const SkeletonBox({super.key, this.height, this.width, this.borderRadius = 16, this.baseColor, this.highlightColor});

  final double? height;
  final double? width;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(duration: const Duration(milliseconds: 1200))..repeat();

    final animation = useMemoized(
      () => Tween<double>(begin: -1.4, end: 2.4).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
      [ctrl],
    );

    final base = baseColor ?? context.colors.surfaceContainer;
    final highlight = highlightColor ?? context.colors.surface;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: ShapeDecoration(
            shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(borderRadius)),
            gradient: LinearGradient(
              begin: Alignment(animation.value, -0.3),
              end: Alignment(animation.value + 1.2, 0.3),
              colors: [base, highlight, base],
              stops: const [0, .45, 1],
            ),
          ),
          child: SizedBox(height: height, width: width),
        );
      },
    );
  }
}
