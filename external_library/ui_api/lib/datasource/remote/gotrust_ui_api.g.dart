// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gotrust_ui_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _GotrustUIAPI implements GotrustUIAPI {
  _GotrustUIAPI(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HomeScreenUiModel> getHomeScreenUI() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HomeScreenUiModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/medicalUI/Screen/F05.01?format=json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HomeScreenUiModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MembershipCardUIModel> getMembershipCardUI() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MembershipCardUIModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/medicalUI/Screen/F05.03?format=json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MembershipCardUIModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileUIModel> getProfileScreenUI() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProfileUIModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/medicalUI/Screen/F05.05?format=json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileUIModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FamilyDoctorUiModel> getFamilyDoctorUI() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FamilyDoctorUiModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/medicalUI/Screen/F05.13?format=json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FamilyDoctorUiModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
