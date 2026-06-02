import 'package:flutter/material.dart';
import 'package:product_catelog_app/_widgets/theme_option_card.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:product_catelog_app/theme/theme_mode_ctrl.dart';

class AppConfigView extends HookConsumerWidget {
  const AppConfigView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeCtrlProvider);
    final themeCtrl = useMemoized(() => ref.read(themeModeCtrlProvider.notifier));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: context.colors.surface,
        title: Text('Settings', style: context.text.titleLarge?.bold.letterSpace(1)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appearance', style: context.text.titleMedium?.semiBold.textColor(context.colors.onSurface)),
            const Gap(6),
            Text(
              'Choose how the app looks to you.',
              style: context.text.bodyMedium?.textColor(context.colors.onSurfaceVariant),
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: ThemeOptionCard(
                    title: 'Light',
                    subtitle: 'Bright and crisp',
                    icon: Icons.wb_sunny_outlined,
                    selected: themeMode == ThemeMode.light,
                    previewMode: ThemeMode.light,
                    onTap: () => themeCtrl.setThemeMode(.light),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: ThemeOptionCard(
                    title: 'Dark',
                    subtitle: 'Soft and focused',
                    icon: Icons.nights_stay_outlined,
                    selected: themeMode == ThemeMode.dark,
                    previewMode: ThemeMode.dark,
                    onTap: () => themeCtrl.setThemeMode(.dark),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
