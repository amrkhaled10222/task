abstract class ApiService {
  Future<T> get<T>(String path, {required JsonConverterResponse<T> fromJson, Map<String, dynamic>? queryParameters});
  Future<List<T>> getList<T>(String path, {required JsonConverterResponse<T> fromJson, Map<String, dynamic>? queryParameters});
  Future<T> post<T>(String path, {dynamic data, required JsonConverterResponse<T> fromJson, String? contentType, bool withData=true});
  Future<List<T>> postList<T>(String path, {required JsonConverterResponse<T> fromJson, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, String? contentType});

  Future<T> put<T>(String path, {dynamic data, required JsonConverterResponse<T> fromJson});
  Future<T> delete<T>(String path, {required JsonConverterResponse<T> fromJson});
}

typedef JsonConverterResponse<T> = T Function(Map<String, dynamic>);
