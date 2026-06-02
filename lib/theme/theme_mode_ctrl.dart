import 'package:flutter/material.dart';
import 'package:product_catelog_app/features/app_config/repository/app_config_repo.dart';
import 'package:product_catelog_app/locator.dart';
import 'package:product_catelog_app/models/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_ctrl.g.dart';

@riverpod
class ThemeModeCtrl extends _$ThemeModeCtrl {
  final _repo = locate<ConfigRepo>();

  @override
  ThemeMode build() {
    _repo.getMainConfig().then((config) {
      state = config.isLightMode ? .light : .dark;
    });

    return ThemeMode.light;
  }

  Future<void> toggle() async {
    await setThemeMode(state == .light ? .dark : .light);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) return;
    state = mode;
    await _repo.updateConfig(AppConfig(isLightMode: mode == .light));
  }
}
