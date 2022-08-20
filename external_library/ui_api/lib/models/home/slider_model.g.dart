// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      displayImage: json['display_image'] as String? ?? '',
      order: json['order'] as int?,
      status: json['status'] as int?,
      urlLink: json['url_link'] as String? ?? '',
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_image': instance.displayImage,
      'order': instance.order,
      'status': instance.status,
      'url_link': instance.urlLink,
    };
