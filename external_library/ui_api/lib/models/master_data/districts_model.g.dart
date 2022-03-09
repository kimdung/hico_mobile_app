// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'districts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictsModel _$DistrictsModelFromJson(Map<String, dynamic> json) =>
    DistrictsModel(
      id: json['id'] as int?,
      provinceId: json['provinceId'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DistrictsModelToJson(DistrictsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provinceId': instance.provinceId,
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
    };
