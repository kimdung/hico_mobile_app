// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceListResponse _$ServiceListResponseFromJson(Map<String, dynamic> json) =>
    ServiceListResponse(
      dataService: json['data'] == null
          ? null
          : DataServiceModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ServiceListResponseToJson(
        ServiceListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.dataService,
    };
