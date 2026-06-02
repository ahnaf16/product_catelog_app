import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.isFav, required this.onTap});

  final bool isFav;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.colors.surface,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black.op(0.1), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Icon(
          isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: 18,
          color: isFav ? Colors.redAccent : context.colors.onSurfaceVariant,
        ),
      ),
    );
  }
}
