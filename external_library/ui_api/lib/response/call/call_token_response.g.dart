// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallTokenResponse _$CallTokenResponseFromJson(Map<String, dynamic> json) =>
    CallTokenResponse(
      data: json['data'] == null
          ? null
          : CallTokenModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$CallTokenResponseToJson(CallTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
