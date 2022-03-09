// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataResponse _$MasterDataResponseFromJson(Map<String, dynamic> json) =>
    MasterDataResponse(
      json['data'] == null
          ? null
          : MasterDataModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$MasterDataResponseToJson(MasterDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.masterDataModel,
    };
