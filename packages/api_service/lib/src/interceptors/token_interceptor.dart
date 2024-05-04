import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../api_service.dart';

@lazySingleton
class TokenInterceptor extends InterceptorsWrapper {
  final TokenService _authTokenService;
  final AuthService _authService;
  final Dio _dio;
  final LanguageService _languageService;

  TokenInterceptor(this._languageService, this._authTokenService,
      this._authService, this._dio) {
    _dio.interceptors.add(this);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _authTokenService.getAuthToken;
    if (token != null) {
      options.headers[Constants.authorization] = '${Constants.bearer} $token';
    }

    options.headers[Constants.acceptedLanguage] =
        _languageService.language.code;

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == HttpStatus.forbidden) {
      _authService.updateStatus(AuthStatus.expired);
      throw FailureResult(
          reason: FailureReasons.unauthorized,
          debugMessage: err.response?.data["message"]);
    }
    // if (err.response!.statusCode == HttpStatus.unauthorized) {
    //   await _tokenRefresherService.refreshToken();
    //   // Update the request header with the new access token
    //   final token = _authTokenService.getAuthToken;

    //   err.requestOptions.headers[Constants.authorization] = '${Constants.bearer} $token';

    //   // Repeat the request with the updated header
    //   return handler.resolve(await _dio.fetch(err.requestOptions));
    // }

      handler.reject(InterceptorError(
          requestOptions: err.requestOptions,
          errorMessage:err.response?.data['message']));
  }
}
