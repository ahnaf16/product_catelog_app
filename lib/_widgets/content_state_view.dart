import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class ContentStateView extends StatelessWidget {
  const ContentStateView({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onActionTap,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: ShapeDecoration(
                  color: context.colors.surfaceContainerHigh,
                  shape: const CircleBorder(),
                ),
                child: Icon(icon, size: 32, color: context.colors.primary),
              ),
              const Gap(16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleMedium?.semiBold,
              ),
              const Gap(6),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium?.textColor(
                  context.colors.onSurfaceVariant,
                ),
              ),
              if (actionLabel != null && onActionTap != null) ...[
                const Gap(18),
                FilledButton.icon(
                  onPressed: onActionTap,
                  icon: const Icon(Icons.refresh_rounded),
                  label: Text(actionLabel!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
