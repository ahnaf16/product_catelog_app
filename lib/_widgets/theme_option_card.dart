import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

class ThemeOptionCard extends StatelessWidget {
  const ThemeOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.previewMode,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final ThemeMode previewMode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLightPreview = previewMode == .light;
    final previewSurface = isLightPreview ? const Color(0xFFF8FAFC) : const Color(0xFF111827);
    final previewCard = isLightPreview ? const Color(0xFFE2E8F0) : const Color(0xFF1F2937);
    final previewAccent = isLightPreview ? context.colors.primary : context.colors.primaryContainer;
    final previewText = isLightPreview ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);

    return Material(
      color: selected ? context.colors.primaryContainer.op(.55) : context.colors.surfaceContainerLow,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(
          color: selected ? context.colors.primary : context.colors.outlineVariant,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(color: context.colors.surface, shape: const CircleBorder()),
                    child: Icon(icon, size: 18, color: context.colors.primary),
                  ),
                  const Spacer(),
                  Icon(
                    selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                    color: selected ? context.colors.primary : context.colors.outline,
                    size: 20,
                  ),
                ],
              ),
              const Gap(14),
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: previewSurface,
                  shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(22)),
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(color: previewAccent, shape: BoxShape.circle),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: previewText.op(.1),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                color: previewCard,
                                shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                          const Gap(8),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: previewCard,
                                      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(18)),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: previewAccent.withValues(alpha: .28),
                                      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(18)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(14),
              Text(title, style: context.text.titleMedium?.semiBold),
              const Gap(4),
              Text(subtitle, style: context.text.bodySmall?.textColor(context.colors.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }
}
