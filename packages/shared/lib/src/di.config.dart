// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared/shared.dart' as _i3;
import 'package:shared/src/logger/logger.dart' as _i6;
import 'package:shared/src/register_module.dart' as _i14;
import 'package:shared/src/services/auth_service.dart' as _i4;
import 'package:shared/src/services/language_service_impl.dart' as _i13;
import 'package:shared/src/services/navigation_service.dart' as _i7;
import 'package:shared/src/services/shared_preferences_service.dart' as _i10;
import 'package:shared/src/services/token_service.dart' as _i11;
import 'package:shared/src/utilities/app_local_storage.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AuthService>(() => _i4.AuthServiceImpl());
    gh.factory<_i5.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.singleton<_i6.Logger>(() => _i6.Logger());
    gh.lazySingleton<_i7.NavigationService>(
        () => _i7.NavigationService(gh<_i8.GlobalKey<_i8.NavigatorState>>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i10.SharedPreferencesService>(
        () => _i10.SharedPreferencesServiceImpl(gh<_i9.SharedPreferences>()));
    gh.factory<_i3.TokenService>(
        () => _i11.TokenServiceImpl(gh<_i3.SharedPreferencesService>()));
    gh.factory<_i12.AppLocalStorage>(
        () => _i12.AppLocalStorageImpl(gh<_i9.SharedPreferences>()));
    gh.factory<_i3.LanguageService>(
        () => _i13.LanguageServiceImpl(gh<_i3.SharedPreferencesService>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
