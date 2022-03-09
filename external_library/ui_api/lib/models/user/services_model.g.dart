// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      serviceCategoryId: json['serviceCategoryId'] as int?,
      name: json['name'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ServicesListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'serviceCategoryId': instance.serviceCategoryId,
      'name': instance.name,
      'list': instance.list,
    };

ServicesListModel _$ServicesListModelFromJson(Map<String, dynamic> json) =>
    ServicesListModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isOnline: json['isOnline'] as int?,
      isOffline: json['isOffline'] as int?,
    );

Map<String, dynamic> _$ServicesListModelToJson(ServicesListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isOnline': instance.isOnline,
      'isOffline': instance.isOffline,
    };
