// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_service_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCategoriesServiceModel _$DataCategoriesServiceModelFromJson(
        Map<String, dynamic> json) =>
    DataCategoriesServiceModel(
      serviceCategories: (json['serviceCategories'] as List<dynamic>?)
          ?.map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordsTotal: json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$DataCategoriesServiceModelToJson(
        DataCategoriesServiceModel instance) =>
    <String, dynamic>{
      'serviceCategories': instance.serviceCategories,
      'recordsTotal': instance.recordsTotal,
    };
