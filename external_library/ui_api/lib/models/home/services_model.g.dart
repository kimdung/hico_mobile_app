// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      displayImage: json['display_image'] as String? ?? '',
      categoryName: json['category_name'] as String? ?? '',
      serviceCategory: json['service_category'] == null
          ? null
          : ServiceCategoryModel.fromJson(
              json['service_category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      price: json['price'] as int?,
      minHours: json['min_hours'] as int?,
      offlinePriceMin: json['offline_price_min'] as int?,
      hours: (json['hours'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'display_image': instance.displayImage,
      'category_name': instance.categoryName,
      'service_category': instance.serviceCategory,
      'description': instance.description,
      'price': instance.price,
      'min_hours': instance.minHours,
      'offline_price_min': instance.offlinePriceMin,
      'hours': instance.hours,
    };
