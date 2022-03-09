// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      provinceName: json['province_name'] as String? ?? '',
      districtName: json['district_name'] as String? ?? '',
      address: json['address'] as String?,
      fullAddress: json['full_address'] as String? ?? '',
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'province_name': instance.provinceName,
      'district_name': instance.districtName,
      'address': instance.address,
      'full_address': instance.fullAddress,
    };
