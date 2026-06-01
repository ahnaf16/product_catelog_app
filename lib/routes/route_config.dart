import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product_catelog_app/features/app_config/view/app_config_view.dart';
import 'package:product_catelog_app/features/favorites/view/favorites_view.dart';
import 'package:product_catelog_app/features/product/view/product_details_view.dart';
import 'package:product_catelog_app/features/product/view/product_view.dart';
import 'package:product_catelog_app/main.dart';
import 'package:product_catelog_app/navigation/navigation_root.dart';

import '../main.export.dart';

typedef RouteRedirect = FutureOr<String?> Function(BuildContext, GoRouterState);
String rootPath = RPaths.products.path;
final routerProvider = NotifierProvider<AppRouter, GoRouter>(AppRouter.new);

class AppRouter extends Notifier<GoRouter> {
  final _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');

  final _shellNavigator = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter _appRouter(RouteRedirect? redirect) {
    return GoRouter(
      navigatorKey: _rootNavigator,
      redirect: redirect,
      initialLocation: rootPath,
      routes: [
        ShellRoute(
          routes: _routes,
          builder: (_, s, c) => AppRoot(key: s.pageKey, child: c),
        ),
      ],
    );
  }

  /// The app router list
  List<RouteBase> get _routes => [
    AppRoute(RPaths.productDetails(':id'), (_) => const ProductDetailsView()),

    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (_, s, child) => NavigationRoot(child, key: s.pageKey),
      routes: [
        AppRoute(RPaths.products, (_) => const ProductView()),
        AppRoute(RPaths.favorites, (_) => const FavoritesView()),
        AppRoute(RPaths.config, (_) => const AppConfigView()),
      ],
    ),
  ];

  @override
  GoRouter build() {
    Ctx._key = _rootNavigator;

    FutureOr<String?> redirectLogic(ctx, GoRouterState state) {
      return null;
    }

    return _appRouter(redirectLogic);
  }
}

class Ctx {
  const Ctx._();
  static GlobalKey<NavigatorState>? _key;
  static BuildContext? get tryContext => _key?.currentContext;

  static BuildContext get context {
    if (_key?.currentContext == null) throw Exception('No context found');
    return _key!.currentContext!;
  }
}
