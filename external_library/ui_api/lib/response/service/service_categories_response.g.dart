// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCategoriesResponse _$ServiceCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceCategoriesResponse(
      dataServiceCategories: json['data'] == null
          ? null
          : DataCategoriesServiceModel.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ServiceCategoriesResponseToJson(
        ServiceCategoriesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.dataServiceCategories,
    };
