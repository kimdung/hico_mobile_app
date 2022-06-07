// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      invoiceId: json['invoice_id'] as int? ?? 0,
      avatarSupplier: json['avatar_supplier'] as String? ?? '',
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceCategories: (json['serviceCategories'] as List<dynamic>?)
          ?.map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bannerHome: json['bannerHome'] as String?,
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceViews: (json['serviceViews'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'invoice_id': instance.invoiceId,
      'avatar_supplier': instance.avatarSupplier,
      'sliders': instance.sliders,
      'serviceCategories': instance.serviceCategories,
      'services': instance.services,
      'bannerHome': instance.bannerHome,
      'news': instance.news,
      'serviceViews': instance.serviceViews,
    };
