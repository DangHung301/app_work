import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:recruit_app/until/const/api_const.dart';

const int _kApiConnectTimeout = 60000;

PrettyDioLogger dioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: false,
  );
}

Dio get createDio {
  final options = BaseOptions(
      baseUrl: url,
      receiveTimeout: _kApiConnectTimeout,
      connectTimeout: _kApiConnectTimeout,);

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.baseUrl = options.baseUrl;
      final token = PrefsService.getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      } else {
        return handler.next(options);
      }
    },
    onResponse: (response, handler) {
      return handler.next(response); // continue
    },
    onError: (DioError e, handler) async {
      return handler.next(e);
    },
  ));

  dio.interceptors.add(dioLogger());

  return dio;
}

class ApiClient {
  Dio _dio;

  ApiClient(this._dio);

  Future<Response<T>> get<T>(
    String uri, {
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    return await _dio.get<T>(
      uri,
      queryParameters: params,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(
      uri,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> delete<T>(
    String uri, {
    Map<String, dynamic>? params,
  }) async {
    return await _dio.delete(
      uri,
      queryParameters: params,
    );
  }

  Future<Response<T>> put<T>(
    String uri, {
    data,
    Map<String, dynamic>? params,
  }) async {
    return await _dio.put(
      uri,
      data: data,
      queryParameters: params,
    );
  }
}
