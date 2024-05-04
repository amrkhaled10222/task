import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../api_service.dart';

@LazySingleton(as: ApiService)
class DioApiService implements ApiService {
  final Dio _dio;
  DioApiService(this._dio) {
    _dio.options.validateStatus = _validateStatus;

  }

  @override
  Future<T> get<T>(String path, {required JsonConverterResponse<T> fromJson, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return fromJson(response.data['data']);
  }

  @override
  Future<List<T>> getList<T>(String path, {required JsonConverterResponse<T> fromJson, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return (response.data['data'] as List<dynamic>).map((e) => fromJson(e)).toList();
  }

  @override
  Future<List<T>> postList<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      String? contentType = Constants.jsonType,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    final response = await _dio.post(path, data: body, queryParameters: queryParameters, options: Options(contentType: contentType));
    return (response.data['data'] as List<dynamic>).map((e) => fromJson(e)).toList();
  }

  @override
  Future<T> post<T>(String path, {dynamic data, required JsonConverterResponse<T> fromJson, String? contentType,bool withData=true}) async {
    final response = await _dio.post(path, data: data, options: Options(contentType: contentType));
    if(withData) return fromJson(response.data['data']);
    return fromJson(response.data);
  }

  @override
  Future<T> put<T>(String path, {dynamic data, required JsonConverterResponse<T> fromJson}) async {
    final response = await _dio.put(path, data: data);
    return fromJson(response.data['data']);
  }

  @override
  Future<T> delete<T>(String path, {required JsonConverterResponse<T> fromJson}) async {
    final response = await _dio.delete(path);
    return fromJson(response.data['data']);
  }

  bool _validateStatus(int? status) {
    if (status != null && status < 300) return true;
    return false;
  }
}
