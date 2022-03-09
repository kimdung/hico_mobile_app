import 'dart:async';

import 'package:dio/dio.dart';

import 'interceptor/auth_interceptor.dart';
// import 'interceptor/token_interceptor.dart';

class DioClient {
  static late Dio _dio;
  static FutureOr<Dio> setup({
    required String baseUrl,
  }) async {
    final options = BaseOptions(
      headers: {
        'Content-type': 'application/json',
      },
      contentType: 'application/json',
      responseType: ResponseType.json,
      // validateStatus: (status) {
      //   return true;
      // },
      baseUrl: baseUrl,
      receiveTimeout: 30000, // 30s
      sendTimeout: 30000, // 30s
    );
    _dio = Dio(options);

    /// Unified add authentication request header
    _dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure
    /// , you can choose to add it)
    // _dio.interceptors.add(TokenInterceptor(_dio));

    return _dio;
  }

  static Dio get dio => _dio;
}
