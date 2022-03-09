// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsResponse _$StatisticsResponseFromJson(Map<String, dynamic> json) =>
    StatisticsResponse(
      data: json['data'] == null
          ? null
          : StatisticsData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$StatisticsResponseToJson(StatisticsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };

StatisticsData _$StatisticsDataFromJson(Map<String, dynamic> json) =>
    StatisticsData(
      canceled: json['canceled'] == null
          ? null
          : StatisticModel.fromJson(json['canceled'] as Map<String, dynamic>),
      completed: json['completed'] == null
          ? null
          : StatisticModel.fromJson(json['completed'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$StatisticsDataToJson(StatisticsData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'canceled': instance.canceled,
      'completed': instance.completed,
    };
