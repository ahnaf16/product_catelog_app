import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:product_catelog_app/theme/theme_mode_ctrl.dart';

class AppConfigView extends HookConsumerWidget {
  const AppConfigView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeCtrlProvider);
    final themeCtrl = useMemoized(() => ref.read(themeModeCtrlProvider.notifier));
    return Scaffold(
      appBar: AppBar(title: const Text('Config')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              tileColor: context.colors.surfaceContainer,
              shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(16)),
              value: themeMode == .light,
              onChanged: (x) => themeCtrl.toggle(),
              title: const Text('Light Mode'),
              subtitle: const Text('Change apps brightness'),
              secondary: const Icon(Icons.brightness_6),
            ),
          ],
        ),
      ),
    );
  }
}
