import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:product_catelog_app/features/app_config/repository/app_config_repo.dart';

import 'locator.config.dart';

final locate = GetIt.instance;

@InjectableInit()
void _configureDependencies() => locate.init();

Future<void> initDependencies() async {
  _configureDependencies();

  await locate<ConfigRepo>().init();
}
