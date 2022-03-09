// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataServiceModel _$DataServiceModelFromJson(Map<String, dynamic> json) =>
    DataServiceModel(
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordsTotal: json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$DataServiceModelToJson(DataServiceModel instance) =>
    <String, dynamic>{
      'services': instance.services,
      'recordsTotal': instance.recordsTotal,
    };
