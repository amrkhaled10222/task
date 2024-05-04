// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_service/api_service.dart' as _i7;
import 'package:api_service/src/api_service/dio_api_service.dart' as _i8;
import 'package:api_service/src/interceptors/logger_interceptor.dart' as _i4;
import 'package:api_service/src/interceptors/token_interceptor.dart' as _i6;
import 'package:api_service/src/register_module.dart' as _i9;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared/shared.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i3.Dio>(
      () => registerModule.dioRefresh(gh<String>(instanceName: 'BaseUrl')),
      instanceName: 'RefreshDio',
    );
    gh.lazySingleton<_i4.LoggerInterceptor>(() => _i4.LoggerInterceptor(
          gh<_i5.Logger>(),
          gh<_i3.Dio>(),
        ));
    gh.lazySingleton<_i6.TokenInterceptor>(() => _i6.TokenInterceptor(
          gh<_i5.LanguageService>(),
          gh<_i5.TokenService>(),
          gh<_i5.AuthService>(),
          gh<_i3.Dio>(),
        ));
    gh.lazySingleton<_i7.ApiService>(() => _i8.DioApiService(gh<_i3.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
