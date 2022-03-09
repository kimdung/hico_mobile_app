// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      base: json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
    };

BaseVersion _$BaseVersionFromJson(Map<String, dynamic> json) => BaseVersion(
      version: json['version'] as int?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BaseVersionToJson(BaseVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'updatedAt': instance.updatedAt,
    };
