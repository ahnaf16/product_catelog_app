// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:product_catelog_app/_core/network/dio_client.dart' as _i1032;
import 'package:product_catelog_app/features/app_config/repository/app_config_repo.dart'
    as _i609;
import 'package:product_catelog_app/features/product/repository/product_repo.dart'
    as _i851;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1032.DioClient>(() => _i1032.DioClient());
    gh.singleton<_i609.ConfigRepo>(() => _i609.ConfigRepo());
    gh.singleton<_i851.ProductRepo>(() => _i851.ProductRepo());
    return this;
  }
}
