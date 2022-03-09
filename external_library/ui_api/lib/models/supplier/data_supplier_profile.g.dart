// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_supplier_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSupplierProfileModel _$DataSupplierProfileModelFromJson(
        Map<String, dynamic> json) =>
    DataSupplierProfileModel(
      profile: json['profile'] == null
          ? null
          : SupplierProfileModel.fromJson(
              json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSupplierProfileModelToJson(
        DataSupplierProfileModel instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };
