import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  static const List<int> unauthorizedTokenCodes = [401];

  TokenInterceptor({required this.errorUnauthorized});

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

  //   super.onRequest(options, handler);
  // }

  Function() errorUnauthorized;

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print('[TokenInterceptor] onError ->');

    if (error.response?.statusCode == 401) {
      errorUnauthorized();
      print('[TokenInterceptor] onError'
          '${error.message}');
    } else {
      super.onError(error, handler);
    }
    // if (error.response == null || error.type != DioErrorType.response) {
    //   return;
    // }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print('[TokenInterceptor] onResponse ->[${response.statusCode}'
  //       ' ${response.requestOptions.path}] : $response ');

  //   if (unauthorizedTokenCodes.contains(response.statusCode)) {}
  //   return super.onResponse(response, handler);
  // }

}
