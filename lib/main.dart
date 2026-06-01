import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:product_catelog_app/_core/storage/hive_registrar.g.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:product_catelog_app/theme/theme_mode_ctrl.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();

  await initDependencies();

  runApp(const ProviderScope(child: _APP()));
}

class _APP extends ConsumerWidget {
  const _APP();

  @override
  Widget build(BuildContext context, ref) {
    final route = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeCtrlProvider);
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.green)),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: .dark),
        ),
        themeMode: themeMode,
        routerConfig: route,
      ),
    );
  }
}

class AppRoot extends HookConsumerWidget {
  const AppRoot({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}
