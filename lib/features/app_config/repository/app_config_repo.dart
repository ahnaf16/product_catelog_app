import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:product_catelog_app/models/config.dart';

@singleton
class ConfigRepo {
  final _boxKey = 'MAIN_CONFIG';

  Box<AppConfig>? _mainConfigBox;

  bool get isLoaded => _mainConfigBox != null;

  Future<Box<AppConfig>> init() async {
    final isOpen = Hive.isBoxOpen(_boxKey);
    if (!isOpen) {
      _mainConfigBox = await Hive.openBox<AppConfig>(_boxKey);
    }
    _mainConfigBox = Hive.box<AppConfig>(_boxKey);

    if (!_mainConfigBox!.containsKey(_boxKey)) await _firstRun();

    return _mainConfigBox!;
  }

  Future<void> _firstRun() async {
    await updateConfig(const AppConfig());
  }

  Future<AppConfig> getMainConfig() async {
    if (_mainConfigBox == null) await init();
    return _mainConfigBox!.get(_boxKey) ?? const AppConfig();
  }

  Future<Box<AppConfig>> updateConfig(AppConfig config) async {
    if (_mainConfigBox == null) await init();
    await _mainConfigBox!.put(_boxKey, config);
    return _mainConfigBox!;
  }
}
