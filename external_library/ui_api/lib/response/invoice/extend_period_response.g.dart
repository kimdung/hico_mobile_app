// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_period_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendPeriodResponse _$ExtendPeriodResponseFromJson(
        Map<String, dynamic> json) =>
    ExtendPeriodResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExtendPeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ExtendPeriodResponseToJson(
        ExtendPeriodResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
