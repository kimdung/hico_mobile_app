// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierProfileResponse _$SupplierProfileResponseFromJson(
        Map<String, dynamic> json) =>
    SupplierProfileResponse(
      data: json['data'] == null
          ? null
          : DataSupplierProfileModel.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$SupplierProfileResponseToJson(
        SupplierProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
