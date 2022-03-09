// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplaces_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkplacesModel _$WorkplacesModelFromJson(Map<String, dynamic> json) =>
    WorkplacesModel(
      provinceId: json['provinceId'] as int?,
      name: json['name'] as String?,
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => DistrictsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkplacesModelToJson(WorkplacesModel instance) =>
    <String, dynamic>{
      'provinceId': instance.provinceId,
      'name': instance.name,
      'districts': instance.districts,
    };

DistrictsModel _$DistrictsModelFromJson(Map<String, dynamic> json) =>
    DistrictsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DistrictsModelToJson(DistrictsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
