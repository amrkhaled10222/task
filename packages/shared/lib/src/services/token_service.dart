import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@Injectable(as: TokenService)
class TokenServiceImpl extends TokenService {
  static const _authTokenKey = 'auth_token_key';
  static const _authRefreshKey = 'auth_refresh_key';

  final SharedPreferencesService _sharedPreferencesService;

  TokenServiceImpl(
    this._sharedPreferencesService,
  );

  @override
  String? get getAuthToken => _sharedPreferencesService.getString(_authTokenKey);
  @override
  String? get getRefreshToken => _sharedPreferencesService.getString(_authRefreshKey);

  @override
  Future<void> setAuthToken(String token) async {
    _sharedPreferencesService.saveString(_authTokenKey, token);
    // _sharedPreferencesService.saveString(_authRefreshKey, refresh);
  }

  @override
  Future<bool> clearAuthToken() async {
    _sharedPreferencesService.removeValue(_authTokenKey);
    return _sharedPreferencesService.removeValue(_authTokenKey);
  }

  @override
  String? getToken(){
    return _sharedPreferencesService.getString(_authTokenKey);
  }

  @override
  bool isAlreadyLoggedIn() => getAuthToken != null;


}
