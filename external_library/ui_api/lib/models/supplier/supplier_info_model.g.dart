// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierInfoModel _$SupplierInfoModelFromJson(Map<String, dynamic> json) =>
    SupplierInfoModel(
      id: json['id'] as int?,
      memberCode: json['member_code'] as String? ?? '',
      avatarImage: json['avatar_image'] as String? ?? '',
      name: json['name'] as String?,
      taskCompleteNumber: json['task_complete_number'] as int?,
      serviceId: json['service_id'] as int?,
      serviceName: json['service_name'] as String? ?? '',
      servicePrice: json['service_price'] as int?,
    );

Map<String, dynamic> _$SupplierInfoModelToJson(SupplierInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_code': instance.memberCode,
      'avatar_image': instance.avatarImage,
      'name': instance.name,
      'task_complete_number': instance.taskCompleteNumber,
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'service_price': instance.servicePrice,
    };
