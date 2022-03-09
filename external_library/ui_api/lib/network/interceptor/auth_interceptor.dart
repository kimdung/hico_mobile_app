import 'package:dio/dio.dart';
import 'package:hico/data/app_data_global.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = options.headers;
    headers.putIfAbsent('content-type', () => 'application/json');
    headers.putIfAbsent('X-localization', () => AppDataGlobal.languageCode);

    if (AppDataGlobal.accessToken.isNotEmpty) {
      headers.putIfAbsent(
          'authorization', () => 'Bearer ${AppDataGlobal.accessToken}');
    }
    handler.next(options);
  }
}
