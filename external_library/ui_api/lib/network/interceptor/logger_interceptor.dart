import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String prettyJsonStr(Map<dynamic, dynamic> json) {
  final encoder = JsonEncoder.withIndent('  ', (data) => data.toString());
  return encoder.convert(json);
}

class LoggerInterceptor extends Interceptor {
  final Function(DioError)? onRequestError;
  //For case response data is too large, dont need to show on log
  final bool Function(Response)? ignoreReponseDataLog;

  LoggerInterceptor({
    this.onRequestError,
    this.ignoreReponseDataLog,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onRequest',
      'Time': DateTime.now().toString(),
      'baseUrl': options.baseUrl,
      'path': options.path,
      'headers': options.headers,
      'method': options.method,
      'requestData': options.data,
      'queryParameters': options.queryParameters,
    }));
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onResponse',
      'Time': DateTime.now().toString(),
      'statusCode': response.statusCode,
      'baseUrl': response.requestOptions.baseUrl,
      'path': response.requestOptions.path,
      'method': response.requestOptions.method,
      'header': response.requestOptions.headers,
      if (ignoreReponseDataLog?.call(response) != false)
        'responseData': response.data,
    }));

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onError',
      'Time': DateTime.now().toString(),
      'baseUrl': error.requestOptions.baseUrl,
      'header': error.requestOptions.headers,
      'path': error.requestOptions.path,
      'type': error.type,
      'message': error.message,
      'statusCode': error.response?.statusCode,
      'error': error.error,
      'responseData': error.requestOptions.data
    }));
    super.onError(error, handler);
  }
}
