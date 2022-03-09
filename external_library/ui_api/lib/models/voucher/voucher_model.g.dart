// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) => VoucherModel(
      id: json['id'] as int?,
      subtitle: json['subtitle'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      displayImage: json['display_image'] as String? ?? '',
      condition: json['condition'] as String?,
      description: json['description'] as String?,
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );

Map<String, dynamic> _$VoucherModelToJson(VoucherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subtitle': instance.subtitle,
      'code': instance.code,
      'name': instance.name,
      'display_image': instance.displayImage,
      'condition': instance.condition,
      'description': instance.description,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
