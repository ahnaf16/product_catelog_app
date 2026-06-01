// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeModeCtrl)
final themeModeCtrlProvider = ThemeModeCtrlProvider._();

final class ThemeModeCtrlProvider
    extends $NotifierProvider<ThemeModeCtrl, ThemeMode> {
  ThemeModeCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeCtrlHash();

  @$internal
  @override
  ThemeModeCtrl create() => ThemeModeCtrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeCtrlHash() => r'03260fe36d77f4c9817dcbecffbd3b58cd2af7b5';

abstract class _$ThemeModeCtrl extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
