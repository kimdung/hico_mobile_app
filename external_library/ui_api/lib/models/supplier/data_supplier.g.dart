// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSupplierModel _$DataSupplierModelFromJson(Map<String, dynamic> json) =>
    DataSupplierModel(
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      suppliers: (json['suppliers'] as List<dynamic>?)
          ?.map((e) => SupplierInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      suppliersOther: (json['suppliers_other'] as List<dynamic>?)
          ?.map((e) => SupplierInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSupplierModelToJson(DataSupplierModel instance) =>
    <String, dynamic>{
      'service': instance.service,
      'suppliers': instance.suppliers,
      'suppliers_other': instance.suppliersOther,
    };
